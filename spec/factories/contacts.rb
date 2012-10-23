# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :contact do
    name "MyString"
    email "email@gmail.com"
    subject "MyString"
    message "MyText"
    read false
  end
end
