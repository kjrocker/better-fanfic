FactoryGirl.define do
  factory :chapter do
    title "MyString"
    raw_text "MyText"
    user
    story
  end
end
