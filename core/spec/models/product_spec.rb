require 'spec_helper'

describe Taurus::Product do

  context "validation" do

    it { should validate_presence_of(:number) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:product_category_name) }
    it { should validate_presence_of(:product_category_id) }
    it { should validate_presence_of(:weight) }
    it { should validate_presence_of(:price_after_tax) }
    
    it { 
      Taurus::Product.create!(:number => 'ebook_001',
														  :name => 'test_ebook',
														  :product_category_name => "test_category",
														  :product_category_id => '24',
														  :market_price => '32.5',
														  :price_after_tax => '16.48',
														  :weight => '0.0',
														  :sales_status => 1,
														  :if_shown_on_web => 1,
														  :product_type => 0)

      should validate_uniqueness_of(:number) 
    }

  end
end

