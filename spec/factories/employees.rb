# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :employee do
    userinfo_id 1
    sex 1
    email "MyString"
    fax "MyString"
    phone "MyString"
    address "MyString"
    note "MyString"
    user_id 1
  end
end
