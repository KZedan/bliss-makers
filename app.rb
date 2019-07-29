require 'sinatra/base'

class Bliss < Sinatra::Base

get '/' do
  redirect "/spaces"
end

get '/logon' do

end

get '/spaces' do
  erb :index
end

get '/spaces/new' do

end

get '/requests' do

end

get '/logout' do

end


run! if app_file == Bliss
end
