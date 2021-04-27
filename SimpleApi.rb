
require 'sinatra'
require 'json'
$CustomerTypes = %w[Paying Free]

get '/GetAllCustomerTypes' do
  content_type :json
  return { CustomerTypes: $CustomerTypes}.to_json
end

## nothing below here is used currently but for a future video

post '/GetFees' do
  data = ReturnData.new
  data.CustomerType = JSON.parse(request.body.read)["CustomerType"]
  data.Amount = 0
  data.Error = ""


  if ($CustomerTypes.include?  data.CustomerType) == false
    data.Error = "customerType not found"
    data.CustomerType = ""
  end

  if(  data.CustomerType == "Paying")
    data.Amount = Time.now.sec.abs
  end

  content_type :json
  return { CustomerTypes:data.CustomerType,
          Amount:data.Amount,
          Error:data.Error}.to_json
end


class ReturnData
  attr_accessor :Error,:Amount,:CustomerType
end