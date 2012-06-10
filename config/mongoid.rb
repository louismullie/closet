Mongoid.configure do |config|
    name = "closet"
    host = "localhost"
    port = 27017
    config.master = Mongo::Connection.new.db(name)
end