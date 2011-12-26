# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :role do
    number "MyString"
    name "MyString"
    description "MyString"
    is_reserve false
  end
end
