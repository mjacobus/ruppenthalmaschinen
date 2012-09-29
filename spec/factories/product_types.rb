# Read about factories at https://github.com/thoughtbot/factory_girl

Factory.define :product_type do |f|
  f.name {Factory.next(:string)}
  f.description {Factory.next(:string)}
  f.sequence(:sequence)
end

