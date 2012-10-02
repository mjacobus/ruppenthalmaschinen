FactoryGirl.define do
  sequence :string  do |n|
    "string #{n}"
  end
  
  sequence :slug  do
    |n| "slug-#{n}"
  end
  
  sequence :integer do |n|
    n
  end
end