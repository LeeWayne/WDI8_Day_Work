require 'sinatra'
require 'sinatra/reloader' if development?
require 'pry-byebug'


get '/' do
  erb :home
end

get '/weather' do
  erb :weather
end

get '/sport' do
  erb :sport
end
get '/gossip' do
  erb :gossip
end
get '/about' do
  erb :about
end

post '/navigate' do
  case params[:destination]
  when 'sport' then redirect to('/sport')
  when 'weather' then redirect to('/weather')
  when 'gossip' then redirect to('/gossip')
  when 'about' then redirect to('/about')
  else
    @error = "Invalid age"
    erb :home
  end
end