require 'spec_helper'

describe Taurus::Product do
  before(:each) do
    @product = Taurus::Product.new
    @product.number = 'ebook_001'
		@product.name = 'test_ebook'
		@product.product_category_name = "test_category"
		@product.product_category_id = '24'
		@product.market_price = '32.5'
		@product.price_after_tax = '16.48'
		@product.weight = '0.0'
		@product.sales_status = 1
		@product.if_shown_on_web = 1
		@product.product_type = 0

		@product.save
  end
  
  context "validation" do

    it { should validate_presence_of(:number) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:product_category_name) }
    it { should validate_presence_of(:product_category_id) }
    it { should validate_presence_of(:weight) }
    it { should validate_presence_of(:price_after_tax) }
    
    it { should validate_uniqueness_of(:number) }

  end
end

