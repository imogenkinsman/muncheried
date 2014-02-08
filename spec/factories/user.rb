FactoryGirl.define do
  factory :user do
    email 'test@aol.com'
    secret_key 'gKnQMUA2v-ucp9udOVucrQ'
    subscribed true
    emailed_at Time.now - 2.days
  end
end