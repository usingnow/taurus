# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :prod_del_ordship do
    delivery_order_id 1
    product_id 1
    quantity 1
  end
end
