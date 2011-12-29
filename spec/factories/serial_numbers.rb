# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :serial_number do
    name "MyString"
    date "MyString"
    sequence 1
  end
end
