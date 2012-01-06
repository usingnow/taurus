# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :inner_sku_cart do
    sku_id 1
    quantity 1
    install_price "9.99"
    assembling_price "9.99"
    delivery_date "2012-01-06"
    total_amount "9.99"
  end
end
