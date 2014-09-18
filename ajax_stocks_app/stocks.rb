require 'sinatra'
require 'sinatra/reloader' if development?
require 'yahoofinance'
require 'json'

get '/' do
  erb :index
end

post '/' do
  redirect to('/' + params['symbol'])
end

get '/:symbol' do
  quote = YahooFinance::get_standard_quotes(params[:symbol])[params[:symbol]]
  @vals = {:updatedAt => DateTime.now}
  [:symbol, :name, :date, :time, :lastTrade].each { |s| @vals[s] = quote.send s }

  if request.xhr?
    [200, {"Content-Type" => "application/json"}, JSON.generate(@vals)]
  else
    erb :quote
  end
end
