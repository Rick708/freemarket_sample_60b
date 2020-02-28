FactoryBot.define do

  factory :image do
    image    {File.open("#{Rails.root}/spec/test_image/logo_yotuba03.png")}
    item
  end
end