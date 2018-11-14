require 'sinatra'
enable :sessions

get '/' do
  p "I am at /"
  erb(:index)
end

post '/list' do
  p "I am at list"
  p params
  @item = params[:item]
  redirect to('/my_list')
end

get '/my_list' do
  p "I am at my list"
   p @item
  # p params
  # @item = params[:item]
  erb(:updated_list)
end
