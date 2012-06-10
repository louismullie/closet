class App::User
  include Mongoid::Document
  field :name, type: String
end