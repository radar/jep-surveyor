class User < ActiveRecord::Base
  include Mongoid::Document
  has_secure_password
  field :email, type: String
  field :password_digest, type: String
end
