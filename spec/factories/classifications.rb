# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :classification do
    product nil
    name "MyString"
    sequence 1
  end
end
