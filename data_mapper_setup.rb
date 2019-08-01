require 'data_mapper'

env = ENV['RACK_ENV'] || ""

# # we're telling datamapper to use a postgres database on localhost. The name will be "bookmark_manager_test" or "bookmark_manager_development" depending on the environment
DataMapper.setup(:default, "postgres://localhost/bliss#{env}")

# require 'dapp' # require each model individually - the path may vary depending on your file structure.
require './lib/space'
require './lib/user'
require './lib/request'

# # After declaring your models, you should finalise them
DataMapper.finalize

# # However, the database tables don't exist yet. Let's tell datamapper to create them
DataMapper.auto_upgrade!
