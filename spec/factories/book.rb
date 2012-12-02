FactoryGirl.define do
  factory :book do
    sequence(:title) {|n| "Book_#{n}"}
    sequence(:id)
  end
end
