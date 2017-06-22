FactoryGirl.define do
  factory :chapter do
    title "MyString"
    raw_text "MyText"
    safe_text "MyText"
    user
  end
end
