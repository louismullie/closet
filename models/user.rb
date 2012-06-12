class User
  
  require 'date'
  
  include Mongoid::Document
  
  has_many :questions, validate: false
  has_many :posts, validate: false
  has_many :comments, validate: false
  
  belongs_to :discussions

  field :name, type: String
  field :email, type: String
  field :city, type: String
  field :province, type: String
  field :country, type: String
  field :info, type: String
  
  field :birth, type: Date
  field :joined, type: Date
  
  field :privileges, type: Array
  field :flags, type: Array

  
end