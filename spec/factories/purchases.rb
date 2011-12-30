# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :purchase do
    number "MyString"
    ordering_company_id 1
    status 1
    note "MyText"
    supplier_id 1
  end
end
