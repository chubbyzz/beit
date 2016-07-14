FactoryGirl.define do
  factory :model do
    sequence(:name) {|n| "#{Faker::Name.name} #{n}"}
    make
  end
end