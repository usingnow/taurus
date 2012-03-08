class Commodity::CategoriesController < ApplicationController
  layout "home"

  def show
    @sku_category = SkuCategory.find(params[:id])
    @search = @sku_category.skus.search(params[:q])
    if @search.sorts.empty?
      @search.sorts = "total_sale desc"
    end
    @skus = @search.result.paginate(:page => params[:page], :per_page => 20)
  end

  def oa_pc
    @slider_bars = SliderBar.limit(5).all
    @categories = SkuCategory.find_all_by_is_show_in_navigation_and_is_show_in_column_and_active_and_parent_id(
                  true,true,true,nil)
    @recommendation = SkuDisplay.index_display(:limit => 4, :page => 1, :location => 0)
    @oa_supplies_skus = SkuDisplay.index_display(:limit => 8, :page => 1, :location => 1)
    @oa_supplies_hots = SkuDisplay.index_display(:limit => 6, :page => 1, :location => 2)
    @oa_paper_skus = SkuDisplay.index_display(:limit => 8, :page => 1, :location => 3)
    @oa_paper_hots = SkuDisplay.index_display(:limit => 6, :page => 1, :location => 4)
    @pc_articles_skus = SkuDisplay.index_display(:limit => 8, :page => 1, :location => 5)
    @pc_articles_hots = SkuDisplay.index_display(:limit => 6, :page => 1, :location => 6)
    @oa_bus_app_skus = SkuDisplay.index_display(:limit => 8, :page => 1, :location => 7)
    @oa_bus_app_hots = SkuDisplay.index_display(:limit => 6, :page => 1, :location => 8)
    @oa_mul_skus = SkuDisplay.index_display(:limit => 8, :page => 1, :location => 9)
    @oa_mul_hots = SkuDisplay.index_display(:limit => 6, :page => 1, :location => 10)
    @oa_ele_of_con_skus = SkuDisplay.index_display(:limit => 8, :page => 1, :location => 11)
    @oa_ele_of_con_hots = SkuDisplay.index_display(:limit => 6, :page => 1, :location => 12)
    @oa_machine_skus = SkuDisplay.index_display(:limit => 8, :page => 1, :location => 13)
    @oa_machine_hots = SkuDisplay.index_display(:limit => 6, :page => 1, :location => 14)
    @other_skus = SkuDisplay.index_display(:limit => 8, :page => 1, :location => 15)
    @other_hots = SkuDisplay.index_display(:limit => 6, :page => 1, :location => 16)

    if current_user.nil?
      @sku_browsing_histories = Hash.new
    else
      @sku_browsing_histories = SkuBrowsingHistory.limit(3).order("quantity desc").where("user_id = #{current_user.id}
        and sku_id in(select id from skus where  id in(select sku_id from sku_on_shelves where status = 1))")
    end

    @images = Image.find_all_by_page(1)

  end

  def office
    @slider_bars = SliderBar.limit(5).all
    @categories = SkuCategory.find_all_by_is_show_in_navigation_and_is_show_in_column_and_active_and_parent_id(
                  true,true,true,nil)
    @recommendation = SkuDisplay.index_display(:limit => 4, :page => 2, :location => 0)
    @folder_skus = SkuDisplay.index_display(:limit => 8, :page => 2, :location => 1)
    @folder_hots = SkuDisplay.index_display(:limit => 6, :page => 2, :location => 2)
    @notebook_paper_skus = SkuDisplay.index_display(:limit => 8, :page => 2, :location => 3)
    @notebook_paper_hots = SkuDisplay.index_display(:limit => 6, :page => 2, :location => 4)
    @office_skus = SkuDisplay.index_display(:limit => 8, :page => 2, :location => 5)
    @office_hots = SkuDisplay.index_display(:limit => 6, :page => 2, :location => 6)
    @pen_skus = SkuDisplay.index_display(:limit => 8, :page => 2, :location => 7)
    @pen_hots = SkuDisplay.index_display(:limit => 6, :page => 2, :location => 8)
    @off_oper_sup_skus = SkuDisplay.index_display(:limit => 8, :page => 2, :location => 9)
    @off_oper_sup_hots = SkuDisplay.index_display(:limit => 6, :page => 2, :location => 10)
    @other_skus = SkuDisplay.index_display(:limit => 8, :page => 2, :location => 11)
    @other_hots = SkuDisplay.index_display(:limit => 6, :page => 2, :location => 12)

    if current_user.nil?
      @sku_browsing_histories = Hash.new
    else
      @sku_browsing_histories = SkuBrowsingHistory.limit(3).order("quantity desc").where("user_id = #{current_user.id}
        and sku_id in(select id from skus where id in(select sku_id from sku_on_shelves where status = 1))")
    end

    @images = Image.find_all_by_page(2)

  end

  def daily
    @slider_bars = SliderBar.limit(5).all
    @categories = SkuCategory.find_all_by_is_show_in_navigation_and_is_show_in_column_and_active_and_parent_id(
                  true,true,true,nil)
    @recommendation = SkuDisplay.index_display(:limit => 4, :page => 3, :location => 0)
    @alcohol_skus = SkuDisplay.index_display(:limit => 8, :page => 3, :location => 1)
    @alcohol_hots = SkuDisplay.index_display(:limit => 6, :page => 3, :location => 2)
    @beverages_skus = SkuDisplay.index_display(:limit => 8, :page => 3, :location => 3)
    @beverages_hots = SkuDisplay.index_display(:limit => 6, :page => 3, :location => 4)
    @food_skus = SkuDisplay.index_display(:limit => 8, :page => 3, :location => 5)
    @food_hots = SkuDisplay.index_display(:limit => 6, :page => 3, :location => 6)
    @beverage_prod_skus = SkuDisplay.index_display(:limit => 8, :page => 3, :location => 7)
    @beverage_prod_hots = SkuDisplay.index_display(:limit => 6, :page => 3, :location => 8)
    @daily_skus = SkuDisplay.index_display(:limit => 8, :page => 3, :location => 9)
    @daily_hots = SkuDisplay.index_display(:limit => 6, :page => 3, :location => 10)
    @heal_man_sup_skus = SkuDisplay.index_display(:limit => 8, :page => 3, :location => 11)
    @heal_man_sup_hots = SkuDisplay.index_display(:limit => 6, :page => 3, :location => 12)
    @personal_care_skus = SkuDisplay.index_display(:limit => 8, :page => 3, :location => 13)
    @personal_care_hots = SkuDisplay.index_display(:limit => 6, :page => 3, :location => 14)
    @ticketing_skus = SkuDisplay.index_display(:limit => 8, :page => 3, :location => 15)
    @ticketing_hots = SkuDisplay.index_display(:limit => 6, :page => 3, :location => 16)
    @other_office_daily_skus = SkuDisplay.index_display(:limit => 8, :page => 3, :location => 17)
    @other_office_daily_hots = SkuDisplay.index_display(:limit => 8, :page => 3, :location => 18)
    @appliances_skus = SkuDisplay.index_display(:limit => 8, :page => 3, :location => 19)
    @appliances_hots = SkuDisplay.index_display(:limit => 6, :page => 3, :location => 20)

    if current_user.nil?
      @sku_browsing_histories = Hash.new
    else
      @sku_browsing_histories = SkuBrowsingHistory.limit(3).order("quantity desc").where("user_id = #{current_user.id}
        and sku_id in(select id from skus where  id in(select sku_id from sku_on_shelves where status = 1))")
    end

    @images = Image.find_all_by_page(3)
  end

  def off_fur
    @slider_bars = SliderBar.limit(5).all
    @categories = SkuCategory.find_all_by_is_show_in_navigation_and_is_show_in_column_and_active_and_parent_id(
                  true,true,true,nil)
    @recommendation = SkuDisplay.index_display(:limit => 4, :page => 4, :location => 0)
    @office_skus = SkuDisplay.index_display(:limit => 8, :page => 4, :location => 1)
    @office_hots = SkuDisplay.index_display(:limit => 6, :page => 4, :location => 2)
    @office_acc_skus = SkuDisplay.index_display(:limit => 8, :page => 4, :location => 3)
    @office_acc_hots = SkuDisplay.index_display(:limit => 6, :page => 4, :location => 4)
    @uniform_skus = SkuDisplay.index_display(:limit => 8, :page => 4, :location => 5)
    @uniform_hots = SkuDisplay.index_display(:limit => 6, :page => 4, :location => 6)
    @appliances_skus = SkuDisplay.index_display(:limit => 8, :page => 4, :location => 7)
    @appliances_hots = SkuDisplay.index_display(:limit => 6, :page => 4, :location => 8)
    @other_skus = SkuDisplay.index_display(:limit => 8, :page => 4, :location => 9)
    @other_hots = SkuDisplay.index_display(:limit => 6, :page => 4, :location => 10)

    if current_user.nil?
      @sku_browsing_histories = Hash.new
    else
      @sku_browsing_histories = SkuBrowsingHistory.limit(3).order("quantity desc").where("user_id = #{current_user.id}
        and sku_id in(select id from skus where  id in(select sku_id from sku_on_shelves where status = 1))")
    end
    @images = Image.find_all_by_page(4)
  end

  def liv_fur
    @slider_bars = SliderBar.limit(5).all
    @categories = SkuCategory.find_all_by_is_show_in_navigation_and_is_show_in_column_and_active_and_parent_id(
                  true,true,true,nil)
    @recommendation = SkuDisplay.index_display(:limit => 4, :page => 5, :location => 0)
    @liv_room_fur_skus = SkuDisplay.index_display(:limit => 8, :page => 5, :location => 1)
    @liv_room_fur_hots = SkuDisplay.index_display(:limit => 6, :page => 5, :location => 2)
    @din_room_fur_skus = SkuDisplay.index_display(:limit => 8, :page => 5, :location => 3)
    @din_room_fur_hots = SkuDisplay.index_display(:limit => 6, :page => 5, :location => 4)
    @bedroom_furniture_skus = SkuDisplay.index_display(:limit => 8, :page => 5, :location => 5)
    @bedroom_furniture_hots = SkuDisplay.index_display(:limit => 6, :page => 5, :location => 6)
    @children_furniture_skus = SkuDisplay.index_display(:limit => 8, :page => 5, :location => 7)
    @children_furniture_hots = SkuDisplay.index_display(:limit => 6, :page => 5, :location => 8)
    @library_furniture_skus = SkuDisplay.index_display(:limit => 8, :page => 5, :location => 9)
    @library_furniture_hots = SkuDisplay.index_display(:limit => 6, :page => 5, :location => 10)
    @storage_supplies_skus = SkuDisplay.index_display(:limit => 8, :page => 5, :location => 11)
    @storage_supplies_hots = SkuDisplay.index_display(:limit => 6, :page => 5, :location => 12)

    if current_user.nil?
      @sku_browsing_histories = Hash.new
    else
      @sku_browsing_histories = SkuBrowsingHistory.limit(3).order("quantity desc").where("user_id = #{current_user.id}
        and sku_id in(select id from skus where  id in(select sku_id from sku_on_shelves where status = 1))")
    end

    @images = Image.find_all_by_page(5)
  end

  def fur_jew
    @slider_bars = SliderBar.limit(5).all
    @categories = SkuCategory.find_all_by_is_show_in_navigation_and_is_show_in_column_and_active_and_parent_id(
                  true,true,true,nil)
    @recommendation = SkuDisplay.index_display(:limit => 4, :page => 6, :location => 0)
    @bedclothes_skus = SkuDisplay.index_display(:limit => 8, :page => 6, :location => 1)
    @bedclothes_hots = SkuDisplay.index_display(:limit => 6, :page => 6, :location => 2)
    @textile_jewelry_skus = SkuDisplay.index_display(:limit => 8, :page => 6, :location => 3)
    @textile_jewelry_hots = SkuDisplay.index_display(:limit => 6, :page => 6, :location => 4)
    @groceries_jewelry_skus = SkuDisplay.index_display(:limit => 8, :page => 6, :location => 5)
    @groceries_jewelry_hots = SkuDisplay.index_display(:limit => 6, :page => 6, :location => 6)
    @bathroom_articles_skus = SkuDisplay.index_display(:limit => 8, :page => 6, :location => 7)
    @bathroom_articles_hots = SkuDisplay.index_display(:limit => 6, :page => 6, :location => 8)


    if current_user.nil?
      @sku_browsing_histories = Hash.new
    else
      @sku_browsing_histories = SkuBrowsingHistory.limit(3).order("quantity desc").where("user_id = #{current_user.id}
        and sku_id in(select id from skus where  id in(select sku_id from sku_on_shelves where status = 1))")
    end

    @images = Image.find_all_by_page(6)
  end
end