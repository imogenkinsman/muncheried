FactoryGirl.define do
  factory :user do
    email 'test@aol.com'
    secret_key { SecureRandom.urlsafe_base64 }
    subscribed true
    emailed_at Time.now - 2.days
  end
end