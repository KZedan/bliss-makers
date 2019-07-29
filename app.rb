require 'sinatra/base'
require 'data_mapper_setup'
class Bliss < Sinatra::Base

get '/' do

end

get '/logon' do

end

get '/spaces' do

end

get '/spaces/new' do

end

get '/requests' do

end


run! if app_file == Bliss
end
