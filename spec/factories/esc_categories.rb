# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :esc_category do
    name "MyString"
    sequence 1
    active false
  end
end
