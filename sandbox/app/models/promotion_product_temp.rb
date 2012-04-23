#encoding:UTF-8
class PromotionProductTemp < ActiveRecord::Base
  belongs_to :administrator
  belongs_to :brand, :class_name => "Brand", :foreign_key => "selection_parameter"
  belongs_to :sku_category, :class_name => "SkuCategory", :foreign_key => "selection_parameter"
  belongs_to :sku, :class_name => "Sku", :foreign_key => "selection_parameter"

  PRODUCTS_SELECTION = { 1 => "分类商品", 2 => "品牌商品", 3 => "指定商品"}

  validates_presence_of :products_selection, :selection_parameter, :administrator_id
  validate :selection_parameter_empty?

  protected
    def selection_parameter_empty?
      ids = PromotionProductTemp.find_all_by_administrator_id_and_products_selection(administrator_id,products_selection).map(&:selection_parameter)
      if ids.member?(selection_parameter.to_i)
        errors.add(:selection_parameter, "已存在")
      end
    end
end
