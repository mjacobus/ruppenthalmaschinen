# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :feature do
    name { FactoryGirl.generate(:string) }
    value "MyString"
    association :product
  end
end
