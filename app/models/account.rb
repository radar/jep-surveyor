class Account
  include Mongoid::Document
  has_many :survey
  has_many :user
  
  field :name, type: String
end
