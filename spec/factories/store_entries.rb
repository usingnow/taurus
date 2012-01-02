# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :store_entry do
    number "MyString"
    purchase_id 1
    ordering_company_id 1
    supplier_id 1
    store_id 1
    note "MyText"
  end
end
