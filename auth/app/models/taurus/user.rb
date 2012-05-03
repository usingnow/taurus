#encoding:UTF-8
module Taurus
  class User < ActiveRecord::Base
    belongs_to :taurus_userable, :polymorphic => true, :dependent => :destroy
    has_one :consignee_info, :dependent => :destroy
    belongs_to :role
    belongs_to :store
    has_many :orders, :dependent => :destroy
    has_many :user_addresses, :dependent => :destroy
    has_one :consignee_info, :dependent => :destroy
    has_many :favorites, :dependent => :destroy
    has_one :mail_sale, :dependent => :destroy
    has_many :back_order_skus, :dependent => :destroy
    has_one :inner_order_payment, :dependent => :destroy
    has_one :inner_order_address, :dependent => :destroy
    before_validation :default_values


    devise :database_authenticatable, :registerable, :confirmable,
           :recoverable, :rememberable, :trackable, :validatable



    attr_accessible :email, :login_no, :password, :password_confirmation, :remember_me, :status, :user_type, :role_id,
                    :store_id, :points

    attr_accessor :password_confirmation, :email_confirmation, :index

    validates_presence_of :login_no
    validates_numericality_of :role_id, :status, :store_id, :only_integer => true
    validates_uniqueness_of :login_no

    def name
      if user_type == 1
        person_extend.name
      elsif user_type == 2
        company_extend.company_name
      else
        "无"
      end
    end

    def number
      user_type == 1 ? person_extend.person_no : company_extend.company_no
    end
    
    #后台订单临时商品统计
    def admin_amount(options={})
      if options[:sku_category_ids]
        back_order_skus.find_all { |c| options[:sku_category_ids].member?(c.sku.sku_category_id) }.sum { |c| c.quantity }
      elsif options[:brand_ids]
        back_order_skus.find_all { |c| options[:brand_ids].member?(c.sku.brand_id) }.sum { |c| c.quantity }
      elsif options[:sku_ids]
        back_order_skus.find_all { |c| options[:sku_ids].member?(c.sku_id) }.sum { |c| c.quantity }
      else
        back_order_skus.sum(:quantity)
      end
    end

    def admin_installation_cost
      back_order_skus.to_a.sum { |temp| temp.installation_cost }
    end

    def admin_assembling_fee
      back_order_skus.to_a.sum { |temp| temp.assembling_fee }
    end

    def admin_sku_price
       back_order_skus.to_a.sum { |temp| temp.sku_price }
    end

    def admin_price
      admin_sku_price + admin_installation_cost + admin_assembling_fee
    end

    def admin_promo_installation_cost
      back_order_skus.to_a.sum { |temp| temp.promotion_installation_cost }
    end

    def admin_promo_assembling_fee
      back_order_skus.to_a.sum { |temp| temp.promotion_assembling_fee }
    end

    def admin_promo_sku_price
       back_order_skus.to_a.sum { |temp| temp.promotion_sku_price }
    end

    def admin_carriage_cost
      if inner_order_address.district.city_no == 330200
        admin_promo_price > 50 ? 0 : 5
      else
        admin_promo_price > 200 ? 0 : 20
      end
    end

    def admin_promo_carriage_cost
      promotion_content(:free_delivery) ? 0 : admin_carriage_cost
    end

    def admin_promo_price
      admin_promo_sku_price + admin_promo_installation_cost + admin_promo_assembling_fee
    end

    def admin_gifts
      promotion_content(:promotion_gifts)
    end

    def current_promotion_ids
      current_promotions.map(&:id).to_s
    end

    protected
      def promotion_content(method)
        result = {:promotion_gifts => [], :free_delivery => false}
        case method
        when :promotion_gifts
          current_promotions.each do |o|
            if o.sku_id
              gift = result[:promotion_gifts].find { |g| g.sku_id == o.sku_id }
              if gift
                gift.amount += 1
              else
                result[:promotion_gifts] << PromotionGift.new(:sku_id => o.sku_id)
              end
            end
          end
        when :free_delivery
          current_order_promotions.each do |p|
            result[:free_delivery] = true if p.online_promotionable.free_delivery == true
          end
        end
        result[method]
      end

      def current_promotions
        online_promotions = []
        back_order_skus.each do |c|
          OnlinePromotion.current_product_promotions(OnlinePromotion.progress_product_promotions,:sku => c.sku, :user => self, :order_channel => 2).each do |online_promotion|
            online_promotions << online_promotion unless online_promotions.map(&:id).member?(online_promotion.id)
          end
        end
        current_order_promotions.each do |p|
          online_promotions << p unless online_promotions.map(&:id).member?(p.id)
        end
        online_promotions
      end

      def current_order_promotions
        order_options = {:order_payment_over => admin_promo_price,
                         :purchase_amount_limit => admin_amount, :user => self,
                         :order_channel => 2, :procedure_id => inner_order_payment.procedure_id}
        OnlinePromotion.current_order_promotions(OnlinePromotion.progress_order_promotions,order_options)
      end

      def default_values
        self.role_id = 2 unless self.role_id
        self.status = 1 unless self.status
        self.store_id = 1 unless self.store_id
      end
  end
end  
