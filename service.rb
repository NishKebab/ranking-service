require 'sinatra'
require_relative 'app'

get '/hi' do
 "HlloWorld"
end

post '/users' do
	request.body.read
end

