#encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

#素材商品
Product.delete_all
Product.create(
  :product_id=>"2004078",
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

#品牌
Brand.delete_all
Brand.create(
  :id=>"1",
  :chinese_name=>"普乐士",
  :english_name=>"",
  :pinyin=>"puleshi",
  :web_address=>"www.plus-cn.com",
  :active=>"true",
  :company_name=>"汕头普乐士仪器有限公司",
  :company_introduction=>"plus",
  :image_url=>"",
  :create_by=>"",
  :update_by=>""
)
Brand.create(
  :id=>"2",
  :chinese_name=>"万仕龙",
  :english_name=>"",
  :pinyin=>"",
  :web_address=>"",
  :active=>"true",
  :company_name=>"亚龙纸制品（昆山）有限公司",
  :company_introduction=>"APP",
  :image_url=>"",
  :create_by=>"",
  :update_by=>""
)

#媒体商品分类
SkuCategory.delete_all
SkuCategory.create(
  :id=>"1774",
  :root_id=>"1769",
  :parent_id=>"1771",
  :number=>"011101003",
  :name=>"进口纯正黑硒鼓",
  :description=>"",
  :is_show_in_navigation=>"true",
  :is_show_in_column=>"true",
  :active=>"true",
  :create_by=>"",
  :update_by=>""
)
SkuCategory.create(
  :id=>"2390",
  :root_id=>"2265",
  :parent_id=>"2388",
  :number=>"022202002",
  :name=>"笔记本",
  :description=>"",
  :is_show_in_navigation=>"true",
  :is_show_in_column=>"true",
  :active=>"true",
  :create_by=>"",
  :update_by=>""
)

#媒体商品
Sku.delete_all
Sku.create(
  :id=>"1",
  :number=>"801142",
  :name=>"普乐士滚轮式保密印章 37-649 黄色",
  :brand_id=>"1",
  :sku_category_id=>"1774",
  :unit=>"个",
  :specification=>"无",
  :type=>"1",
  :model=>"37-649",
  :size=>"长75*宽45mm",
  :delivery_day=>"3",
  :delivery_description=>"不定",
  :can_return=>"false",
  :description=>"<p><br />对于要丢弃的写有个人信息的资料您是如何处理的呢？比如账单、信封、文件&hellip;&hellip;</p>
                 <p>一般人会撕成小片，或者带到公司使用碎纸机。您会不会觉得很麻烦呢？普乐士的这款保密章可以完全轻松解决此问题。</p>
                 <p>当物件印有个人资料又不希望给别人看见时，只要使用保密章在上面滚一下，资料立刻保密。由于使用的是洗不掉的油性黑色墨水，您可以放心地丢弃这些纸张。</p>
                 <p>产品：普乐士保密印章<br />颜色：黄色</p>
                 <p>壹美壹家服务承诺：<br />
                 壹美壹家向您保证所售商品均为正品行货，自带机打发票，与商品一起寄送。凭质保证书及壹美壹家发票，
                 可享受全国联保服务，与您亲临商场选购的商品享受相同的质量保证。<br />
                 壹美壹家还为您提供具有竞争力的商品价格，请您放心购买！ 声明:因厂家会在没有任何提前通知的情况下更改产品包装、
                 产地或者一些附件，本司不能确保客户收到的货物与商城图片、产地、附件说明完全一致。只能确保为原厂正货！
                 并且保证与当时市场上同样主流新品一致。若本商城没有及时更新，请大家谅解！</p>",
  :color=>"黄色",
  :can_on_be_half=>"false",
  :classifcation=>"1",
  :is_integral=>"false",
  :integral=>"0",
  :introduction=>"小小身材，发挥大大作用",
  :advertisement=>"",
  :status=>"2",
  :sales_status=>"1",
  :cost_bef_tax=>"41.02",
  :cost_aft_tax=>"48.00",
  :market_price=>"0.00",
  :assembling_fee_bef_tax=>"0.00",
  :assembling_fee_aft_tax=>"0.00",
  :installation_cost_bef_tax=>"0.00",
  :insatllation_cost_aft_tax=>"0.00",
  :create_by=>"",
  :update_by=>"",
  :total_sale=>"0"
)
Sku.create(
  :id=>"2",
  :number=>"801087",
  :name=>"亚龙软面笔记本 M008 A5",
  :brand_id=>"2",
  :sku_category_id=>"2390",
  :unit=>"本",
  :specification=>"A5",
  :type=>"1",
  :model=>"M008",
  :size=>"长205*宽145mm,行距/8mm",
  :delivery_day=>"7",
  :delivery_description=>"一周一次",
  :can_return=>"false",
  :description=>"<p>产品名称：亚龙软面笔记本</p>
                <p>F封面型号：M008</p>
                <p>尺寸：长205*宽145mm</p>
                <p>行距：8mm</p>
                <p>颜色：混色</p>
                <p>生产厂家：亚龙纸制品（昆山）有限公司</p>
                <p>壹美壹家服务承诺：<br />
                壹美壹家向您保证所售商品均为正品行货，自带机打发票，与商品一起寄送。凭质保证书及壹美壹家发票，可享受全国联保服务，与您亲临商场选购的商品享受相同的质量保证。<br />
                壹美壹家还为您提供具有竞争力的商品价格，请您放心购买！ 声明:因厂家会在没有任何提前通知的情况下更改产品包装、产地或者一些附件，本司不能确保客户收到的货物与商城图片、产地、附件说明完全一致。只能确保为原厂正货！并且保证与当时市场上同样主流新品一致。若本商城没有及时更新，请大家谅解！<br />
                &nbsp;</p>
                <p>&nbsp;</p>",
  :color=>"黄色/蓝色",
  :can_on_be_half=>"false",
  :classifcation=>"1",
  :is_integral=>"false",
  :integral=>"0",
  :introduction=>"壹美壹家最便宜的本本",
  :advertisement=>"",
  :status=>"2",
  :sales_status=>"1",
  :cost_bef_tax=>"1.45",
  :cost_aft_tax=>"1.70",
  :market_price=>"0.00",
  :assembling_fee_bef_tax=>"0.00",
  :assembling_fee_aft_tax=>"0.00",
  :installation_cost_bef_tax=>"0.00",
  :insatllation_cost_aft_tax=>"0.00",
  :create_by=>"",
  :update_by=>"",
  :total_sale=>"0"
)
Sku.create(
  :id=>"3",
  :number=>"801094",
  :name=>"亚龙硬面笔记本 M010 A5 5包装",
  :brand_id=>"2",
  :sku_category_id=>"2390",
  :unit=>"本",
  :type=>"1",
  :specification=>"A5",
  :model=>"M010",
  :size=>"长210*宽150mm,行距/8mm",
  :delivery_day=>"7",
  :delivery_description=>"一周一次",
  :can_return=>"false",
  :description=>"<p>产品名称：亚龙精装本（硬面笔记本）</p>
                <p>F封面型号：M010</p>
                <p>尺寸：长210*宽150mm</p>
                <p>行距：8mm</p>
                <p>颜色：混色</p>
                <p>壹美壹家服务承诺：<br />
                壹美壹家向您保证所售商品均为正品行货，自带机打发票，与商品一起寄送。凭质保证书及壹美壹家发票，可享受全国联保服务，与您亲临商场选购的商品享受相同的质量保证。<br />
                壹美壹家还为您提供具有竞争力的商品价格，请您放心购买！ 声明:因厂家会在没有任何提前通知的情况下更改产品包装、产地或者一些附件，本司不能确保客户收到的货物与商城图片、产地、附件说明完全一致。只能确保为原厂正货！并且保证与当时市场上同样主流新品一致。若本商城没有及时更新，请大家谅解！<br />
                &nbsp;</p>
                <p>&nbsp;<br />
                &nbsp;</p>",
  :color=>"绿/黑/红/蓝",
  :can_on_be_half=>"false",
  :classifcation=>"1",
  :is_integral=>"false",
  :integral=>"0",
  :introduction=>"书壳成型好",
  :advertisement=>"",
  :status=>"2",
  :sales_status=>"1",
  :cost_bef_tax=>"16.23",
  :cost_aft_tax=>"19.00",
  :market_price=>"0.00",
  :assembling_fee_bef_tax=>"0.00",
  :assembling_fee_aft_tax=>"0.00",
  :installation_cost_bef_tax=>"0.00",
  :insatllation_cost_aft_tax=>"0.00",
  :create_by=>"",
  :update_by=>"",
  :total_sale=>"0"
)
Sku.create(
  :id=>"4",
  :number=>"801081",
  :name=>"前通记事本 DV69-A502",
  :brand_id=>"2",
  :sku_category_id=>"2390",
  :unit=>"本",
  :type=>"1",
  :specification=>"B5",
  :model=>"DV69-A502",
  :size=>"长260*宽190mm,行距/8mm",
  :delivery_day=>"7",
  :delivery_description=>"一周一次",
  :can_return=>"false",
  :description=>"<p>产品名称：前通笔记本</p>
                <p>品牌：前通</p>
                <p>型号：DV69系列 DV69-A502</p>
                <p>厂家：深圳市前通实业有限公司</p>
                <p>内芯材质：木浆纸</p>
                <p>产品特点：方脊圆角软抄--新颖亮丽，外观简洁大方；内芯采用环保木浆纸，保护视力。</p>
                <p><br />
                壹美壹家服务承诺：<br />
                壹美壹家向您保证所售商品均为正品行货，自带机打发票，与商品一起寄送。凭质保证书及壹美壹家发票，可享受全国联保服务，与您亲临商场选购的商品享受相同的质量保证。<br />
                壹美壹家还为您提供具有竞争力的商品价格，请您放心购买！ 声明:因厂家会在没有任何提前通知的情况下更改产品包装、产地或者一些附件，本司不能确保客户收到的货物与商城图片、产地、附件说明完全一致。只能确保为原厂正货！并且保证与当时市场上同样主流新品一致。若本商城没有及时更新，请大家谅解！<br />
                &nbsp;</p>",
  :color=>"黄/红/蓝/黑",
  :can_on_be_half=>"false",
  :classifcation=>"1",
  :is_integral=>"false",
  :integral=>"0",
  :introduction=>"绝佳纸质，商务记述必备",
  :advertisement=>"",
  :status=>"2",
  :sales_status=>"1",
  :cost_bef_tax=>"12.99",
  :cost_aft_tax=>"15.20",
  :market_price=>"0.00",
  :assembling_fee_bef_tax=>"0.00",
  :assembling_fee_aft_tax=>"0.00",
  :installation_cost_bef_tax=>"0.00",
  :insatllation_cost_aft_tax=>"0.00",
  :create_by=>"",
  :update_by=>"",
  :total_sale=>"0"
)
Sku.create(
  :id=>"5",
  :number=>"801107",
  :name=>"渡边线圈笔记本 R0050 B5",
  :brand_id=>"2",
  :sku_category_id=>"2390",
  :unit=>"本",
  :type=>"1",
  :specification=>"B5",
  :model=>"R0050",
  :size=>"长252*宽179mm,行距/8mm",
  :delivery_day=>"3",
  :delivery_description=>"下单后三天内送货上门",
  :can_return=>"false",
  :description=>"<p>产品名称：渡边线圈笔记本</p>
                <p>封面型号：R0050</p>
                <p>尺寸：B5&nbsp; 长252*宽179mm</p>
                <p>行距：8mm</p>
                <p>颜色：混色</p>
                <p>壹美壹家服务承诺：<br />
                壹美壹家向您保证所售商品均为正品行货，自带机打发票，与商品一起寄送。凭质保证书及壹美壹家发票，可享受全国联保服务，与您亲临商场选购的商品享受相同的质量保证。<br />
                壹美壹家还为您提供具有竞争力的商品价格，请您放心购买！ 声明:因厂家会在没有任何提前通知的情况下更改产品包装、产地或者一些附件，本司不能确保客户收到的货物与商城图片、产地、附件说明完全一致。只能确保为原厂正货！并且保证与当时市场上同样主流新品一致。若本商城没有及时更新，请大家谅解！</p>",
  :color=>"绿/红/橙/蓝",
  :can_on_be_half=>"false",
  :classifcation=>"1",
  :is_integral=>"false",
  :integral=>"0",
  :introduction=>"100%可平铺",
  :advertisement=>"",
  :status=>"2",
  :sales_status=>"1",
  :cost_bef_tax=>"3.33",
  :cost_aft_tax=>"3.90",
  :market_price=>"0.00",
  :assembling_fee_bef_tax=>"0.00",
  :assembling_fee_aft_tax=>"0.00",
  :installation_cost_bef_tax=>"0.00",
  :insatllation_cost_aft_tax=>"0.00",
  :create_by=>"",
  :update_by=>"",
  :total_sale=>"0"
)

