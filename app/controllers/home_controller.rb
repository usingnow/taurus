class HomeController < ApplicationController
  def index
    @slider_bars = SliderBar.limit(5).all
    @categories = SkuCategory.find_all_by_is_show_in_navigation_and_is_show_in_column_and_active_and_parent_id(
                  true,true,true,nil)
    @recommendation = SkuDisplay.order("sequence desc").find_all_by_page_and_location(0,0)
    @oa_pc_skus = Sku.category_skus '01'
    @oa_pc_hots = Sku.category_hots '01'
    @office_skus = Sku.category_skus '02'
    @office_hots = Sku.category_hots '02'
    @daily_skus = Sku.category_skus '03'
    @daily_hots = Sku.category_hots '03'
    @off_fur_skus = Sku.category_skus '04'
    @off_fur_hots = Sku.category_hots '04'
    @liv_fur_skus = Sku.category_skus '05'
    @liv_fur_hots = Sku.category_hots '05'
    @fur_jew_skus = Sku.category_skus '06'
    @fur_jew_hots = Sku.category_hots '06'

    if current_user.nil?
      @sku_browsing_histories = Hash.new
    else
      @sku_browsing_histories = SkuBrowsingHistory.limit(3).order("quantity desc").where("user_id = #{current_user.id}
        and sku_id in(select id from skus where status = 1 and id in(select sku_id from sku_on_shelves where status = 1))")
    end


    @images = {}
    Image.find_all_by_page(0).each do |image|
      @images.store(image.location, image.image.url)
    end

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

end