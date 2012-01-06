# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :inner_order_payment do
    procedure_id 1
    invoice_type 1
    account_bank "MyString"
    account_person_name "MyString"
    account_phone "MyString"
    account_no "MyString"
    added_value_tax_no "MyString"
    account_reg_add "MyString"
    is_invoice_head 1
    company_name "MyString"
    user_id 1
  end
end
