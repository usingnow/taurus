# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :province do
    number "MyString"
    name "MyString"
    free_shipping_limit "9.99"
    shipping_fee "9.99"
  end
end
