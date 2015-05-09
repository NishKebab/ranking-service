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
	game.id.to_json
end

get '/games/:id' do |id|
	game = Game.find_by(id: id.to_i)
end




