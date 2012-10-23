FactoryGirl.define do
  sequence :string  do |n|
    "string #{n}"
  end
  
  sequence :email  do |n|
    "email#{n}@gmail.com"
  end
  
  sequence :slug  do
    |n| "slug-#{n}"
  end
  
  sequence :integer do |n|
    n
  end
end