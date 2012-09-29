# Read about factories at https://github.com/thoughtbot/factory_girl
Factory.define :service do |f|
  f.title {Factory.next(:string)}
  f.description "description"
  f.enabled true
end