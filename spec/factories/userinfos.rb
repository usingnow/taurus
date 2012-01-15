# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :userinfo do
    login_no "MyString"
    password "MyString"
    status 1
    userinfo_type 1
  end
end
