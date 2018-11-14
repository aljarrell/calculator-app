require 'sinatra'
require_relative 'addition.rb'
require_relative 'subtraction.rb'
require_relative 'multiplication.rb'
require_relative 'division.rb'

get '/' do
  erb :number_one 
end
