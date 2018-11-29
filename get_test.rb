require 'net/http'
require 'json'

def send_data(url,hash_data)  
    uri = URI(url)
    req = Net::HTTP::Post.new(uri, 'Content-Type' => 'application/json')
    req.body = hash_data.to_json
    res = Net::HTTP.start(uri.hostname, uri.port) do |http|
        http.request(req).body
    end
end

address = ARGV[0]
amount = ARGV[1].to_i*1000000

hash_data = { 
    :jsonrpc => '2.0', 
    :id => 1,
    :method => 'sendtoaddress' ,
    :params => [address,amount]
  }


puts send_data("http://150.109.196.219:6553",hash_data);
