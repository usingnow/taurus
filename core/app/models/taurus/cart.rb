#encoding:UTF-8
module Taurus
  class Cart < ActiveRecord::Base
  	has_many :cart_product_line_items, :dependent => :destroy

    # 添加商品到购物车,参数（商品ID）
    # 返回添加的商品对象
    # Examples:
    #   @line_item = @cart.add_product(params[:product_id])
    #   @line_item.save
  	def add_product(product_id)
      line_item = cart_product_line_items.find_by_product_id(product_id)
      if line_item
      	line_item.product_amount += 1
      else
      	line_item = cart_product_line_items.build(:product_id => product_id)
      end
      line_item
  	end

    def total_price
      cart_product_line_items.to_a.sum { |line_item| line_item.subtotal }
    end

    def total_amount
      cart_product_line_items.to_a.sum { |line_item| line_item.product_amount }
    end
  	
  end
end