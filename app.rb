require 'sinatra'
require_relative 'addition.rb'
require_relative 'subtraction.rb'
require_relative 'multiplication.rb'
require_relative 'division.rb'

get '/' do
  erb :number_one
end

post '/number_one' do
  number_one = params[:number_one]
  redirect '/number_two?number_one=' + number_one
end

get '/number_two' do
  number_one = params[:number_one]
  erb :number_two, locals: {number_one: number_one}
end

post '/number_two' do
  number_two = params[:number_two]
  number_one = params[:number_one]
  redirect '/operator?number_one=' + number_one + '&number_two=' + number_two
end

get '/operator' do
  number_two = params[:number_two]
  number_one = params[:number_one]
  erb :operator, locals: {number_one: number_one, number_two: number_two}
end

post '/operator' do
  total = params[:total]
  #p total
  number_two = params[:number_two]
  number_one = params[:number_one]
  redirect '/calculation?number_one=' + number_one + '&number_two=' + number_two + '&total=' + total
end

get '/calculation' do
  total = params[:total]
  number_two = params[:number_two].to_f
  number_one = params[:number_one].to_f
  if total == "add"
    function = add(number_one, number_two)
    total = "+"
  elsif total == "subtract"
    function = subtract(number_one, number_two)
    total = "-"
  elsif total == "multiply"
    function = multiply(number_one, number_two)
    total = "*"
  elsif total == "division"
    function = division(number_one, number_two)
    total = "/"
  end
  erb :calculation, locals: {number_one: number_one, number_two: number_two, total: total, function: function}
end
