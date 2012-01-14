# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :delivery_order do
    order_id 1
    store_id 1
    administrator_id 1
  end
end
