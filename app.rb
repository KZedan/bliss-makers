require 'sinatra/base'
require 'data_mapper'
require_relative './data_mapper_setup.rb'
require_relative './lib/user.rb'
require_relative './lib/space.rb'

class Bliss < Sinatra::Base

get '/' do

end




get '/signup' do
  # p User.create(
  #   :user_name => "Ben",
  #   :email => "Benp@Ben.wutsup",
  #   :password => "thisismypassword",
  # )
  erb :signup
end

get '/spaces' do

  erb :index
end

post '/spaces' do

end

get '/spaces/new' do
  p Space.create(
    :space_name => "Elizabeth Manor",
    :description => "Manor like",
    :price => 200,
    :user_id => 2
  )
end

get '/requests' do
  erb :requests
end

get '/logout' do

end


run! if app_file == $0
end
