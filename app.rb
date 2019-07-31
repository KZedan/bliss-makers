require 'sinatra/base'
require 'data_mapper'
require_relative './data_mapper_setup.rb'
require_relative './lib/user.rb'
require_relative './lib/space.rb'

class Bliss < Sinatra::Base
  enable :sessions

  get '/' do

  end

  get '/details' do
    erb :space
  end

  get '/sessions/new' do
    erb :login
  end

  post '/sessions' do
    @user = User.last(:email => params[:email])
    session[:user_id] = @user.id
    redirect '/spaces'
  end

  get '/signup' do
    erb :signup
  end

  post '/signup/new' do
    user = User.create(
      :user_name => params[:user_name],
      :email => params[:email],
      :password => params[:password],
    )
  session[:user_id] = user.id
  redirect '/spaces'
  end

  get '/spaces' do
    @user = User.get(session[:user_id])
  erb :index
  end

  post '/spaces' do
    p Space.create(
      :space_name => params[:space_name],
      :description => params[:description],
      :price => params[:price],
      :user_id => session[:user_id],
    )
    redirect '/spaces'
  end

  get '/spaces/new' do
    erb :new
  end

  get '/requests' do
    erb :requests
  end

  get '/logout' do

  end



  run! if app_file == $0
end
