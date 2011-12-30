# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :city do
    province_id 1
    name "MyString"
    number "MyString"
    free_shipping_limit "9.99"
    shipping_fee "9.99"
  end
end
