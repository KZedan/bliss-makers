require 'sinatra/base'
require 'data_mapper'
require_relative './data_mapper_setup.rb'
require_relative './lib/user.rb'
require_relative './lib/space.rb'

class Bliss < Sinatra::Base

get '/' do
   p User.create(
        :user_name => "yowutsup",
        :email => "yowutsup@yo.wutsup",
        :password => "thisismypassword",
    )
  p Space.create(
        :space_name => "Elizabeth Manor",
        :description => "Manor like",
        :price => 200,
        :user_id => 1
      )
end

get '/logon' do

end

get '/spaces' do

end

get '/spaces/new' do

end

get '/requests' do

end


run! if app_file == $0
end
