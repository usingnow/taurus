# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :order_print_log do
    order_id 1
    print_type 1
    created_by "MyString"
    admin_id 1
  end
end
