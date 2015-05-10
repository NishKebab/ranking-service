require 'sinatra'
require 'json'
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
	Users.all.to_json
end

get '/games' do 
	Games.all.to_json
end

post '/games/new' do
	params = JSON.parse(request.body.read)
	game = Games.new
	game.players = params["players"]
	game.start_positions = params["start_positions"]
	game.save
	request.host + "/games/%s" % game.id
end

get '/games/:id' do |id|
	game = Games.find_by(id: id)
	game.to_json
end




