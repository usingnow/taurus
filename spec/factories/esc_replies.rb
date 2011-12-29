# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :esc_reply do
    esc_id 1
    replier 1
    content "MyText"
    status_changed_info "MyString"
  end
end
