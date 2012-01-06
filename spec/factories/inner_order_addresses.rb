# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :inner_order_address do
    name "MyString"
    district_no "MyString"
    address "MyString"
    phone "MyString"
    mobile "MyString"
    email "MyString"
    zip "MyString"
    user_id 1
  end
end
