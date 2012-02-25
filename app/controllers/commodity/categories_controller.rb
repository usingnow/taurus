class Commodity::CategoriesController < ApplicationController
  layout "home"

  def show
    @search = SkuCategory.find(params[:id]).skus.search(params[:q])
    if @search.sorts.empty?
      @search.sorts = "total_sale desc"
    end
    @skus = @search.result.paginate(:page => params[:page], :per_page => 20)
  end

  def oa_pc
    @slider_bars = SliderBar.limit(5).all
    @categories = SkuCategory.find_all_by_is_show_in_navigation_and_is_show_in_column_and_active_and_parent_id(
                  true,true,true,nil)
    @recommendation = Sku.recommendation
    @oa_supplies_skus = Sku.category_skus '0111'
    @oa_supplies_hots = Sku.category_hots '0111'
    @oa_paper_skus = Sku.category_skus '0112'
    @oa_paper_hots = Sku.category_hots '0112'
    @pc_articles_skus = Sku.category_skus '0113'
    @pc_articles_hots = Sku.category_hots '0113'
    @oa_bus_app_skus = Sku.category_skus '0114'
    @oa_bus_app_hots = Sku.category_hots '0114'
    @oa_mul_skus = Sku.category_skus '0115'
    @oa_mul_hots = Sku.category_hots '0115'
    @oa_ele_of_con_skus = Sku.category_skus '0116'
    @oa_ele_of_con_hots = Sku.category_hots '0116'
    @oa_machine_skus = Sku.category_skus '0117'
    @oa_machine_hots = Sku.category_hots '0117'

    if current_user.nil?
      @sku_browsing_histories = Hash.new
    else
      @sku_browsing_histories = SkuBrowsingHistory.limit(3).order("quantity desc").where("user_id = #{current_user.id}
        and sku_id in(select id from skus where status = 1 and id in(select sku_id from sku_on_shelves where status = 1))")
    end

  end

  def office
    @slider_bars = SliderBar.limit(5).all
    @categories = SkuCategory.find_all_by_is_show_in_navigation_and_is_show_in_column_and_active_and_parent_id(
                  true,true,true,nil)
    @recommendation = Sku.recommendation
    @folder_skus = Sku.category_skus '0221'
    @folder_hots = Sku.category_hots '0221'
    @notebook_paper_skus = Sku.category_skus '0222'
    @notebook_paper_hots = Sku.category_hots '0222'
    @office_skus = Sku.category_skus '0223'
    @office_hots = Sku.category_hots '0223'
    @pen_skus = Sku.category_skus '0224'
    @pen_hots = Sku.category_hots '0224'
    @off_oper_sup_skus = Sku.category_skus '0225'
    @off_oper_sup_hots = Sku.category_hots '0225'
    @other_skus = Sku.category_skus '0229'
    @other_hots = Sku.category_hots '0229'

    if current_user.nil?
      @sku_browsing_histories = Hash.new
    else
      @sku_browsing_histories = SkuBrowsingHistory.limit(3).order("quantity desc").where("user_id = #{current_user.id}
        and sku_id in(select id from skus where status = 1 and id in(select sku_id from sku_on_shelves where status = 1))")
    end

  end

  def daily
    @slider_bars = SliderBar.limit(5).all
    @categories = SkuCategory.find_all_by_is_show_in_navigation_and_is_show_in_column_and_active_and_parent_id(
                  true,true,true,nil)
    @recommendation = Sku.recommendation
    @alcohol_skus = Sku.category_skus '0330'
    @alcohol_hots = Sku.category_hots '0330'
    @beverages_skus = Sku.category_skus '0331'
    @beverages_hots = Sku.category_hots '0331'
    @food_skus = Sku.category_skus '0332'
    @food_hots = Sku.category_hots '0332'
    @beverage_prod_skus = Sku.category_skus '0333'
    @beverage_prod_hots = Sku.category_hots '0333'
    @daily_skus = Sku.category_skus '0334'
    @daily_hots = Sku.category_hots '0334'
    @heal_man_sup_skus = Sku.category_skus '0335'
    @heal_man_sup_hots = Sku.category_hots '0335'
    @personal_care_skus = Sku.category_skus '0336'
    @personal_care_hots = Sku.category_hots '0336'
    @ticketing_skus = Sku.category_skus '0337'
    @ticketing_hots = Sku.category_hots '0337'
    @other_office_daily_skus = Sku.category_skus '0339'
    @other_office_daily_hots = Sku.category_hots '0339'
    @appliances_skus = Sku.category_skus '0340'
    @appliances_hots = Sku.category_hots '0340'

    if current_user.nil?
      @sku_browsing_histories = Hash.new
    else
      @sku_browsing_histories = SkuBrowsingHistory.limit(3).order("quantity desc").where("user_id = #{current_user.id}
        and sku_id in(select id from skus where status = 1 and id in(select sku_id from sku_on_shelves where status = 1))")
    end
  end

  def off_fur
    @slider_bars = SliderBar.limit(5).all
    @categories = SkuCategory.find_all_by_is_show_in_navigation_and_is_show_in_column_and_active_and_parent_id(
                  true,true,true,nil)
    @recommendation = Sku.recommendation
    @office_skus = Sku.category_skus '0441'
    @office_hots = Sku.category_hots '0441'
    @office_acc_skus = Sku.category_skus '0442'
    @office_acc_hots = Sku.category_hots '0442'
    @uniform_skus = Sku.category_skus '0443'
    @uniform_hots = Sku.category_hots '0443'
    @appliances_skus = Sku.category_skus '0444'
    @appliances_hots = Sku.category_hots '0444'
    @other_skus = Sku.category_skus '0449'
    @other_hots = Sku.category_hots '0449'

    if current_user.nil?
      @sku_browsing_histories = Hash.new
    else
      @sku_browsing_histories = SkuBrowsingHistory.limit(3).order("quantity desc").where("user_id = #{current_user.id}
        and sku_id in(select id from skus where status = 1 and id in(select sku_id from sku_on_shelves where status = 1))")
    end
  end

  def liv_fur
    @slider_bars = SliderBar.limit(5).all
    @categories = SkuCategory.find_all_by_is_show_in_navigation_and_is_show_in_column_and_active_and_parent_id(
                  true,true,true,nil)
    @recommendation = Sku.recommendation
    @liv_room_fur_skus = Sku.category_skus '0551'
    @liv_room_fur_hots = Sku.category_hots '0551'
    @din_room_fur_skus = Sku.category_skus '0552'
    @din_room_fur_hots = Sku.category_hots '0552'
    @bedroom_furniture_skus = Sku.category_skus '0553'
    @bedroom_furniture_hots = Sku.category_hots '0553'
    @children_furniture_skus = Sku.category_skus '0554'
    @children_furniture_hots = Sku.category_hots '0554'
    @library_furniture_skus = Sku.category_skus '0555'
    @library_furniture_hots = Sku.category_hots '0555'
    @storage_supplies_skus = Sku.category_skus '0556'
    @storage_supplies_hots = Sku.category_hots '0556'

    if current_user.nil?
      @sku_browsing_histories = Hash.new
    else
      @sku_browsing_histories = SkuBrowsingHistory.limit(3).order("quantity desc").where("user_id = #{current_user.id}
        and sku_id in(select id from skus where status = 1 and id in(select sku_id from sku_on_shelves where status = 1))")
    end
  end

  def fur_jew
    @slider_bars = SliderBar.limit(5).all
    @categories = SkuCategory.find_all_by_is_show_in_navigation_and_is_show_in_column_and_active_and_parent_id(
                  true,true,true,nil)
    @recommendation = Sku.recommendation
    @bedclothes_skus = Sku.category_skus '0661'
    @bedclothes_hots = Sku.category_hots '0661'
    @textile_jewelry_skus = Sku.category_skus '0662'
    @textile_jewelry_hots = Sku.category_hots '0662'
    @groceries_jewelry_skus = Sku.category_skus '0663'
    @groceries_jewelry_hots = Sku.category_hots '0663'
    @bathroom_articles_skus = Sku.category_skus '0665'
    @bathroom_articles_hots = Sku.category_hots '0665'


    if current_user.nil?
      @sku_browsing_histories = Hash.new
    else
      @sku_browsing_histories = SkuBrowsingHistory.limit(3).order("quantity desc").where("user_id = #{current_user.id}
        and sku_id in(select id from skus where status = 1 and id in(select sku_id from sku_on_shelves where status = 1))")
    end
  end
end