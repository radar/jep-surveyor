class User
  include Mongoid::Document
  include ActiveModel::SecurePassword

  belongs_to :account

  field :email, type: String
  field :password_digest, type: String
  
  has_secure_password
  
  def token
    JWT.encode payload, ENV['PRIVATE_KEY'], 'HS256'
  end

  def self.decode_payload(token:)
    JWT.decode token, ENV['PRIVATE_KEY'], true, { algorithm: 'HS256' }
  end
  
  private
  def payload
    {
      email: email,
      id: id.to_s
    }
  end
end
