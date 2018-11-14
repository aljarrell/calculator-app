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
