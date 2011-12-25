# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :order_number do
    date "2011-12-25"
    seq 1
  end
end
