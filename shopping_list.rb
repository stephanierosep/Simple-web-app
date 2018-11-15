require 'sinatra'

# class Shopping_list < Sinatra::Base
#   use Rack::Session::Pool

  # configure do
  enable :sessions
  # set :session_secret, "My session secret"
  # end

  get '/' do
    erb(:index)
  end

  post '/list' do
    p params
    session[:item] = params[:item]
    p "line 18"
    p session[:item]
    p "item is " << session[:item]
    p "line 20"
    redirect to('/my_list')
  end

  get '/my_list' do
    p "value = " << session[:item].inspect
    @item = session[:item]
    p "line 25"
    p session[:item]
    p "line 27"
    erb(:updated_list)
  end

  get '/checkout' do
    erb(:checkout)
  end

  get '/homepage' do
    erb(:homepage)
  end
