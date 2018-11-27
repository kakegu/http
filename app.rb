require "json"
require "pp"
require 'sinatra'
# require 'rack/ssl'
# use Rack::SSL

port = ARGV[0]
set :bind, '0.0.0.0'
set :port, port
set :root, File.dirname(__FILE__)
set :public_folder, Proc.new { File.join(root, "static") }
set :views, Proc.new { File.join(root, "view") }

json = File.read('keys.json')
keys = JSON.parse(json)

get '/' do
    erb :index
end
