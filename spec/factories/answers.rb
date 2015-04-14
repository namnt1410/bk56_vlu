# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :answer do
    question nil
    title "MyString"
    description "MyText"
  end
end
