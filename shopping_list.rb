require 'sinatra'

# class Shopping_list < Sinatra::Base
#
# configure do
#   enable :sessions
#   set :session_secret, "groceries"
# end

enable :sessions

# set :session, :expire_after => 10000000
# use Rack::Session::Pool

  get '/' do
    erb(:index)
  end

  post '/list' do
    if session[:items]
      session[:items] << params[:item]
    else
      session[:items] = []
      session[:items] << params[:item]
    end 
    redirect to('/my_list')
  end

  get '/my_list' do
    @list = session[:items]
    erb(:updated_list)
  end

  get '/checkout' do
    erb(:checkout)
  end

  get '/homepage' do
    erb(:homepage)
  end
