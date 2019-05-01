class User
  include Mongoid::Document
  include ActiveModel::SecurePassword
  has_secure_password
  belongs_to :account

  field :email, type: String
  field :password_digest, type: String
end