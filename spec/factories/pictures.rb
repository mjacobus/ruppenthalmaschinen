# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :picture do
    imageable_id 1
    imageable_type "MyString"
    title "MyString"
    description "MyText"
    file_file_name "MyString"
    file_file_size 1
    file_content_type "MyString"
    file_updated_at "2012-09-28 14:42:19"
  end
end
