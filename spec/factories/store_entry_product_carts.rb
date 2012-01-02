# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :store_entry_product_cart do
    product_id 1
    quantity 1
    delivery_date "2012-01-02"
    unit_price_aft_tax "9.99"
    total_amount "9.99"
    admin_id 1
  end
end
