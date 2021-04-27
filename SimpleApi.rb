
require 'sinatra'
require 'json'
$CustomerTypes = %w[Paying Free]

get '/GetAllCustomerTypes' do
  content_type :json
  return { CustomerTypes: $CustomerTypes}.to_json
end

## nothing below here is used currently but for a future video

post '/GetFees' do
  push = JSON.parse(request.body.read)
  data = ReturnData.new
  data.CustomerType = push["CustomerType"]
  data.Amount = 0
  data.Error = ""
  content_type :json

  if ($CustomerTypes.include?  data.CustomerType) == false
    data.Error = "customerType not found"
    data.CustomerType = ""
  end

  if(  data.CustomerType == "Paying")
    data.Amount = Time.now.sec.abs
  end

  return { CustomerTypes:data.CustomerType,
          Amount:data.Amount,
          Error:data.Error}.to_json
end


class ReturnData
  attr_accessor :Error,:Amount,:CustomerType
end