# Read about factories at https://github.com/thoughtbot/factory_girl


FactoryGirl.define do
  factory :product do
    name { FactoryGirl.generate(:string) }
    application "MyText"
    association :type, :factory => :product_type
    association :category
    home false
    enabled true
  end
end
