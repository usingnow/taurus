# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :rec_add do
    user_id 1
    district_no "MyString"
    name "MyString"
    address "MyString"
    zip "MyString"
    phone "MyString"
    mobile "MyString"
    email "MyString"
  end
end
