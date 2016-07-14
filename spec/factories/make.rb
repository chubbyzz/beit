FactoryGirl.define do
  factory :make do
    sequence(:name) {|n| "#{Faker::Name.name} #{n}"}
    webmotors_id Faker::Number.number 3
  end
end