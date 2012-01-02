# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :product_store_entryship do
    store_entry_id 1
    product_id 1
    quantity 1
    delivery_date "2011-12-31"
  end
end
