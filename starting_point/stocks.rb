require 'sinatra'
require 'sinatra/reloader' if development?
require 'yahoofinance'
require 'json'

get '/' do
  @vals={}
  erb :index
end

post '/' do
  redirect to('/' + params['symbol'].upcase)
end

get '/:symbol' do
  stock_symbol = params[:symbol].upcase
  quote = YahooFinance::get_standard_quotes(stock_symbol)[stock_symbol]
  @vals = {:updatedAt => DateTime.now}
  [:symbol, :name, :date, :time, :lastTrade].each { |s| @vals[s] = quote.send s }

  if request.xhr?
    [200, {"Content-Type" => "application/json"}, JSON.generate(@vals)]
  else
    erb :quote
  end
end
