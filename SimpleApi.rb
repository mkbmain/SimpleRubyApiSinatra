require 'sinatra'
require 'json'
$CustomerTypes = %w[Paying Free]

get '/GetAllCustomerTypes' do
  content_type :json
  return { CustomerTypes: $CustomerTypes }.to_json
end

## nothing below here is used currently but for a future video

post '/GetFees' do
  customerType = JSON.parse(request.body.read)["CustomerType"]

  content_type :json
  if ($CustomerTypes.include? customerType) == false
    return { Error: "customerType not found" }.to_json
  end

  return { CustomerTypes: customerType,
           Amount: customerType == "Paying" ? Time.now.sec.abs : 0 }.to_json
end


