# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :product_purchaseship do
    product_id 1
    purchase_id 1
    quantity 1
    unit_price_aft_tax "9.99"
    total_amount "9.99"
    delivery_date "2011-12-29"
  end
end
