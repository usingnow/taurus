class HomeController < ApplicationController
  def index
    @slider_bars = SliderBar.limit(5).all
    @categories = SkuCategory.top_navigation
    @recommendation = SkuDisplay.index_display(:limit => 4, :page => 0, :location => 0)
    @oa_pc_skus = SkuDisplay.index_display(:limit => 8, :page => 0, :location => 1)
    @oa_pc_hots = SkuDisplay.index_display(:limit => 6, :page => 0, :location => 2)
    @office_skus = SkuDisplay.index_display(:limit => 8, :page => 0, :location => 3)
    @office_hots = SkuDisplay.index_display(:limit => 6, :page => 0, :location => 4)
    @daily_skus = SkuDisplay.index_display(:limit => 8, :page => 0, :location => 5)
    @daily_hots = SkuDisplay.index_display(:limit => 6, :page => 0, :location => 6)
    @off_fur_skus = SkuDisplay.index_display(:limit => 8, :page => 0, :location => 7)
    @off_fur_hots = SkuDisplay.index_display(:limit => 6, :page => 0, :location => 8)
    @liv_fur_skus = SkuDisplay.index_display(:limit => 8, :page => 0, :location => 9)
    @liv_fur_hots = SkuDisplay.index_display(:limit => 6, :page => 0, :location => 10)
    @fur_jew_skus = SkuDisplay.index_display(:limit => 8, :page => 0, :location => 11)
    @fur_jew_hots = SkuDisplay.index_display(:limit => 6, :page => 0, :location => 12)

    if current_user.nil?
      @sku_browsing_histories = Hash.new
    else
      @sku_browsing_histories = SkuBrowsingHistory.limit(3).order("updated_at desc").where("user_id = #{current_user.id}
        and sku_id in(select id from skus where id in(select sku_id from sku_on_shelves where status = 1))")
    end


    @images = Image.find_all_by_page(0)


    @announcements = Announcement.limit(6).order("created_at desc").all
  end

  def who_am_i
    render "home/help/who_am_i.html.erb"
  end

  def group_partner
    render "home/help/group_partner.html.erb"
  end

  def join_us
    render "home/help/join_us.html.erb"
  end

  def media_report
    render "home/help/media_report.html.erb"
  end

  def registration_help
    render "home/help/registration_help.html.erb"
  end

  def how_to_buy
    render "home/help/how_to_buy.html.erb"
  end

  def how_to_query_order
    render "home/help/how_to_query_order.html.erb"
  end

  def deliver_area_help
    render "home/help/deliver_area_help.html.erb"
  end

  def deliver_fee_help
    render "home/help/deliver_fee_help.html.erb"
  end

  def deliver_time_help
    render "home/help/deliver_time_help.html.erb"
  end

  def payment_method_help
    render "home/help/payment_method_help.html.erb"
  end

  def monthly_check_help
    render "home/help/monthly_check_help.html.erb"
  end

  def coupon_help
    render "home/help/coupon_help.html.erb"
  end

  def refund_principle
    render "home/help/refund_principle.html.erb"
  end

  def complaints_suggestion_help
    render "home/help/complaints_suggestion_help.html.erb"
  end

  def users_terms
    render "home/help/users_terms.html.erb"
  end

  def forget_password
    render "home/help/forget_password.html.erb"
  end

  def faq
    render "home/help/faq.html.erb"
  end

  def contact_sd
    render "home/help/contact_sd.html.erb"
  end

  def pub_1
    render "home/pub/pub_1.html.erb"
  end

end