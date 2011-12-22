# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :procedure do
    name "MyString"
    display_name "MyString"
    active false
    sequence 1
  end
end
