FactoryBot.define do

  factory :user do
    
    nickname {"a"}
    email {Faker::Internet.free_email}
    password {password}
    password_confirmation {password}
  end

end