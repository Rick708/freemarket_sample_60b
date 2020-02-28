FactoryBot.define do

  factory :item do
    name            {"abc"} 
    content         {"abc"} 
    price           {"100"}
    status          {0}
    delivery_charge {nil}
    send_day        {nil}
    size            {nil}
    delivery_method {nil}
    prefecture_code {nil}
    seller_id       {"3"}
    buyer           {nil}
    condition       {nil}
  end
end