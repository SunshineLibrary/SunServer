FactoryGirl.define do
  factory :app do
    sequence(:id)
    sequence(:name) {|n| "App_#{n}"}
  end
end
