require 'sinatra/base'
require 'data_mapper'
require 'sinatra/flash'
require_relative './data_mapper_setup.rb'
require_relative './lib/user.rb'
require_relative './lib/space.rb'

class Bliss < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do

  end

  # get '/spaces/:id' do
  #   erb :details
  # end
  #
  # # post '/spaces/:id' do
  # #   redirect '/requests'
  # # end

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
    params[:from]
    @user = User.get(session[:user_id])
    @available_spaces = []
    p @spaces = Space.all
    @spaces.each do |space|
      p dates = space.available_dates
      dates.each do |date|
        if date == params[:from]
          @available_spaces << space
        end
        p @available_spaces
      end
    end
    erb :search
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

  get '/logout' do

  end

  # temp route for dev
  get '/details' do
    erb :space
  end



  run! if app_file == $0
end
