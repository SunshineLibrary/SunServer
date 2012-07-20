FactoryGirl.define do
  factory :tag do
    sequence(:name) {|n| "Tag_#{n}"}
    sequence(:tag_type) {|n| "Type_#{n % 5}"}
  end
end