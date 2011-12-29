# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :esc do
    number "MyString"
    esc_category_id 1
    user_id 1
    status 1
    order_id 1
    not_registration_user_info "MyString"
    user_other_info "MyString"
    title "MyString"
    description "MyText"
    created_by 1
  end
end
