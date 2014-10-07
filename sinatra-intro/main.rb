require 'pry-byebug'
require 'sinatra'
require 'sinatra/reloader' if development?

get '/' do
  'this is the home page'
end
get '/hi' do

  "<li>Hello all of you #{Time.now}</li>"
end

get '/:page/greeting' do
  return params.inspect
  params[:page]
  "you requested the '#{params[:page]}' page"
end

get '/multiply/:x/:y' do
  result = params[:x].to_i * params[:y].to_i

  "the result is #{result}"
end




