require 'sinatra'
require_relative 'app'

get '/hi' do
 "HlloWorld"
end

post '/users' do
	user = JSON.parse(request.body.read)
	halt "Please provide name" if user["name"].nil?
	halt "Please provide email" if user["email"].nil?
	Users.create(name: user["name"], email: user["email"])
end

get '/users' do 
	Users.all
end


