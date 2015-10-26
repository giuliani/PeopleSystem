FactoryGirl.define do
  factory :person do
    first_name "Test"
    last_name "User"
    sequence(:email) { |n| "test.user+#{n}@example.com" }
    job "Software Engineer"
    bio "This is my bio"
    gender "u"
    birthdate (1..60).to_a.sample.years.ago
    picture "http://images.com/1.jpg"
  end
end
