# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :order_take_log do
    order_id 1
    oper_type 1
    created_by "MyString"
    admin_id 1
  end
end
