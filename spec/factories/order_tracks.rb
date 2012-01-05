# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :order_track do
    order_id 1
    is_display false
    description "MyString"
    created_by "MyString"
    admin_id 1
  end
end
