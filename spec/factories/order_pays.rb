# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :order_pay do
    order_id 1
    procedure_id 1
    buyer_alipay_no "MyString"
    alipay_date "2011-12-27 15:32:59"
    alipay_no "MyString"
    alipay_price "9.99"
    province_no "MyString"
    remittance_no "MyString"
    price "9.99"
    pay_date "2011-12-27 15:32:59"
    pay_bank "MyString"
    remitter "MyString"
    note "MyString"
    bank_id 1
    status 1
  end
end
