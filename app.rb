require 'sinatra/base'
require 'data_mapper'
require 'sinatra/flash'

require 'bcrypt'
require_relative './data_mapper_setup'
require_relative './lib/user'
require_relative './lib/space'
require_relative './lib/request'

class Bliss < Sinatra::Base

  enable :sessions

  register Sinatra::Flash

  get '/' do
    redirect '/sessions/new'
  end


  get '/spaces/:id/details' do
    @space = Space.get(params[:id])
    session[:space_id] = @space.id
    session[:space_name] = @space.space_name
    erb :space
  end

  post '/spaces/:id/details' do
    redirect '/requests'
  end


  get '/sessions/new' do
    erb :login
  end

  # Authenticates the users login details, flash warning if issue
  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])

    if user
      session[:user_id] = user.id
      session[:space_id] = user.space_id
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
   encrypted_password = BCrypt::Password.create(params[:password])
    user = User.create(
      :user_name => params[:user_name],
      :email => params[:email],
      :password => encrypted_password
    )
  session[:user_id] = user.id
  redirect '/spaces'
  end

  get '/spaces' do
    @user = User.get(session[:user_id])
    @user_space = User.get(session[:space_name])
    @spaces = Space.all
  erb :index
  end

  get '/spaces/new' do
    erb :new
  end

  get '/spaces/search' do
    params[:from]
    @user = User.get(session[:user_id])
    @available_spaces = []
    @spaces = Space.all
    @spaces.each do |space|
      dates = space.available_dates
      dates.each do |date|
        if date == params[:from]
          @available_spaces << space
        end
        @available_spaces
      end
    end
    erb :search
  end

  post '/spaces' do
    Space.create(
      :space_name => params[:space_name],
      :description => params[:description],
      :price => params[:price],
      :available_from => params[:available_from],
      :available_to => params[:available_to],
      :user_id => session[:user_id],
    )
    redirect '/spaces'
  end


  get '/spaces/:id/details' do
    @space = Space.get(params[:id])
    session[:space_id] = @space.id
    session[:space_name] = @space.space_name
    erb :space
  end

  post '/spaces/:id/details' do
    redirect '/requests'
  end

  get '/requests' do
   @requests = Request.all
   @id_check = session[:user_id]
   @id_compare_space = session[:space_id]
   @id_compare = session[:user_id]
   erb :requests
  end

  post '/requests/new' do
    session[:check_in] = params[:check_in_date]
    params
    space = Space.get(session[:space_id])
    if space.available_dates.include?(session[:check_in])
      Request.create(
        :space_name => session[:space_name],
        :user_id => session[:user_id],
        :space_id => session[:space_id],
        :check_in => session[:check_in],
        :confirmed => false
      )
      redirect ('/requests/load')

    else
      flash[:notice] = 'Listing is not available on this date.'
      redirect '/spaces'
    end
  end

  get '/requests/load' do
    redirect ('/requests')
  end

  post '/requests/confirm' do
    space_edit = Request.all(:space_id => session[:space_id])
    space_edit.update(:confirmed => true)
    redirect ('/requests')
  end

  get '/logout' do
    redirect ('/')

  end

  run! if app_file == $0
end
