# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :track do
    instance_id 1
    station_id 1
    condition_id 1
    next_station_id 1
    created_by "MyString"
  end
end
