class Account
  include Mongoid::Document
  has_many :users
  has_many :surveys

  field :name, type: String
end
