require 'sinatra/base'
require 'data_mapper'
require 'sinatra/flash'
require_relative './data_mapper_setup'
require_relative './lib/user'
require_relative './lib/space'
require_relative './lib/request'

class Bliss < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do

  end

  get '/spaces/:id' do
  end

  post '/spaces/:id' do
    redirect '/requests'
  end

  get '/sessions/new' do
    erb :login
  end

  post '/sessions' do
    user = User.authenticate(params[:email])

    if user
      session[:user_id] = user.id
      user = User.last(:email => params[:email])
      redirect '/spaces'
    else
      flash[:notice] = 'Please check your email and/or password.'
      redirect '/sessions/new'
    end
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
    @spaces = Space.all
  erb :index
  end

  get '/spaces/search' do
    p params[:from]

  end

  post '/spaces' do
    Space.create(
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

  post '/requests/new' do
    Request.new(
      :user_id => session[:user_id],
      :space_id => 
    )
  end


  get '/logout' do

  end

  # temp route for dev
  get '/details' do
    erb :space
  end

  run! if app_file == $0
end
