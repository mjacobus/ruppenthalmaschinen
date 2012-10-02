# Read about factories at https://github.com/thoughtbot/factory_girl


FactoryGirl.define do
  factory :product do
    name "MyString"
    application "MyText"
    association :type, :factory => :product_type
  end
end
