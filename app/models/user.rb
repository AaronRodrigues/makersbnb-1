require 'data_mapper'
require 'dm-postgres-adapter'

class User
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :username, String
  property :email, String, required: true

end

DataMapper.setup(:default, "postgres://localhost/makersbnb_test")
DataMapper.finalize
DataMapper.auto_migrate!
