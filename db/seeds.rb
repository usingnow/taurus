#encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
Product.delete_all
Product.create(:product_id=>"2004078",
               :name=>"壹美壹家纯棉浅绿色面巾",
               :cost_bef_tax=>"0.00",
               :cost_aft_tax=>"0.00",
               :brand_id=>"30",
               :product_category_id=>"033409001",
               :unit=> "条",
               :specification=> "无",
               :delivery_days=>"0",
               :type=>"4",
               :model=>"",
               :size=> "350*800mm",
               :delivery_descprition=>"0",
               :description=>"材质/全棉，尺寸/350*800mm，颜色/浅绿色",
               :color=>"",
               :can_on_behalf=>"0",
               :barcode=>"",
               :supplier_id=>"供应商id",
               :manufacturer=>"靖江海贝纺织有限公司",
               :have_shelf_life => "1",
               :shelf_life=>"",
               :have_wanrranty=>"0",
               :wanrranty=>"保修期",
               :wanrranty_description=>"",
               :origin=> "中国",
               :appendant=>"",
               :is_green=>"0",
               :is_assembling_required=>"0",
               :assembling_fee_bef_tax=>"0",
               :assembling_fee_aft_tax=>"0",
               :maintenance_cost_bef_tax=> "0",
               :maintenance_cost_aft_tax=> "",
               :is_installation_required=> "0",
               :installation_cost_bef_tax=>"0",
               :insatllation_cost_aft_tax=>"",
               :create_time=> "2010-11-23 0:02:00",
               #:created_by=> "创建人"
               :update_time=> "2010-11-23 0:02:00"
               #:updated_by=> "更新人"
)

