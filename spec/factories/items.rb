FactoryBot.define do

  factory :item do
    name            {"abc"} 
    content         {"abc"} 
    price           {"100"}
    status          {0}
    delivery_charge {""}
    send_day        {""}
    size            {""}
    delivery_method {""}
    prefecture_code {""}
    seller          
    buyer           
    condition       {""}
  end
end