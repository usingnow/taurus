class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      
      #素材商品基本信息
      t.string :product_id  #素材商品编号
      t.string :name  #素材商品名
      t.decimal :cost_bef_tax, :precision => 8, :scale => 2  #税前成本
      t.decimal :cost_aft_tax, :precision => 8, :scale => 2  #税后成本
      # t.decimal :recommended_gm_rate, :precision => 8, :scale => 2  #推荐税前毛利率
      t.string :brand_id  #素材商品品牌
      t.string :product_category_id  #素材商品目录id
      t.string :unit  #素材商品单位
      t.string :specification  #素材商品规格
      t.integer :delivery_days  #供应商交货日数
      t.integer :type  #直送品或在库品
      t.string :model  #素材商品模型
      t.string :size  #素材商品尺寸
      t.string :delivery_descprition  #交货描述
      t.text :description  #素材商品描述
      t.string :color  #素材商品颜色
      t.boolean :can_on_behalf  #是否允许代购
      t.string :barcode  #素材商品Barcode
      
      #供应商、产地、质保、保修、附属品信息
      t.string :supplier_id  #供应商id
      t.string :manufacturer  #素材商品生产商
      t.boolean :have_shelf_life  #是否有质保期
      t.integer :shelf_life  #质保期
      t.boolean :have_wanrranty  #是否有保修期
      t.integer :wanrranty  #保修期
      t.text :wanrranty_description  #保修期描述
      t.string :origin  #原产地
      t.string :appendant  #附属品
      t.boolean :is_green  #是否绿色环保产品
      
      #素材商品组装、安装、维修费用信息
      t.boolean :is_assembling_required  #是否需要组装
      t.decimal :assembling_fee_bef_tax, :precision => 8, :scale => 2  #税前组装费
      t.decimal :assembling_fee_aft_tax, :precision => 8, :scale => 2  #税后组装费
      t.boolean :is_maintanable  #是否可维修商品
      t.decimal :maintenance_cost_bef_tax, :precision => 8, :scale => 2  #税前维护手续费
      t.decimal :maintenance_cost_aft_tax, :precision => 8, :scale => 2  #税后维护手续费
      t.boolean :is_installation_required  #是否需要安装
      t.decimal :installation_cost_bef_tax, :precision => 8, :scale => 2  #税前安装费用
      t.decimal :insatllation_cost_aft_tax, :precision => 8, :scale => 2  #税后安装费用
      
      #素材商品管理相关记录
      t.time :create_time  #创建时间
      t.string :created_by  #创建人
      t.time :update_time  #最近更新时间                               ``
      t.string :updated_by  #更新人

      t.timestamps
    end
  end

  def self.down
    drop_table :products
  end
end
