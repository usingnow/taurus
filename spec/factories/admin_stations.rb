# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :station do
    name "MyString"
    display_name "MyString"
    condition_function "MyString"
    business_function "MyString"
    station_type 1
    sequence 1
    safe_quantity 1
  end
end
