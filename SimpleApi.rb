
require 'sinatra'
require 'json'
$CustomerTypes = %w[Paying Free]

get '/GetAllCustomerTypes' do
  content_type :json
  return { CustomerTypes: $CustomerTypes}.to_json
end

## nothing below here is used currently but for a future video

post '/TestPost' do

  response = map_from_json_string(TestPostRequest.new, request.body.read)
  return { "message": response.Age > 55 ? 'Over 55' : '55 or under' }.to_json
end

get '/GetFees' do
  data = ReturnData.new
  # data.CustomerType = JSON.parse(request.body.read)["CustomerType"]
  data.CustomerType = params[:CustomerType]
  data.Amount = 0
  data.Error = ''


  if ($CustomerTypes.include?  data.CustomerType) == false
    data.Error = 'customerType not found'
    data.CustomerType = ''
  end

  data.Amount = Time.now.sec.abs if (  data.CustomerType == 'Paying')

  content_type :json
  return { CustomerTypes:data.CustomerType,
          Amount:data.Amount,
          Error:data.Error}.to_json
end

def map_from_json_string(obj, str)
  map_from_hash_table(obj, JSON.parse(str))
end

def map_from_hash_table(obj, hash_table)
  props = obj.methods
  props.each do |item|
    clean = item[0..-2]
    if item.to_s.end_with?('=') && hash_table.key?(clean)
      val = hash_table[clean]
      obj.send("#{clean}=", val)
    end
  end
  obj
end

class ReturnData
  attr_accessor :Error,:Amount,:CustomerType
end

class TestPostRequest
  attr_accessor :exampleBody,:Age,:log
end
