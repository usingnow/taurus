# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :company_type do
    name "MyString"
    sequence 1
  end
end
