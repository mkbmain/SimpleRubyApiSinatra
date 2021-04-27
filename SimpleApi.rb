
require 'sinatra'
require 'json'
$CustomerTypes = %w[Paying Free]

get '/GetAllCustomerTypes' do
  content_type :json
  return { CustomerTypes: $CustomerTypes}.to_json
end

post '/GetFees' do
  push = JSON.parse(request.body.read)
  customerType = push["CustomerType"]
  content_type :json
  data = ReturnData.new
  data.CustomerType = customerType
  data.Amount = 0
  data.Error = ""

  if ($CustomerTypes.include?customerType) == false
    data.Error = "customerType not found"
    customerType = ""
  end

  if(customerType == "Paying")
    data.Amount = Time.now.sec.abs
  end

  return { CustomerTypes:data.CustomerType,
          Amount:data.Amount,
          Error:data.Error}.to_json
end


class ReturnData
  attr_accessor :Error,:Amount,:CustomerType
end