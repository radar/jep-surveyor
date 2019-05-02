require 'jwt'

class User

  include Mongoid::Document
  include ActiveModel::SecurePassword
  field :email, type: String
  field :password_digest, type: String
  
  has_secure_password
  
  
    def private_key
      'my$ecretK3y'
    end
    
    def payload(user:)
      {
        email: email
        id: id
      }
    end
    
  def token
    token = JWT.encode payload, private_key, 'HS256'
  end

private
end
