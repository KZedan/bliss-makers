require 'sinatra/base'

class Bliss < Sinatra::Base

get '/' do
  redirect "/spaces"
end

get '/signup' do
  erb :signup
end

get '/spaces' do
  erb :index
end

post '/spaces' do

end

get '/spaces/new' do
  erb :new
end

get '/requests' do
  erb :requests
end

get '/logout' do

end


run! if app_file == Bliss
end
