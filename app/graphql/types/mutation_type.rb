require 'jwt'

module Types
  class MutationType < Types::BaseObject
    field :create_rating_question, mutation: Mutations::CreateRatingQuestion
    field :update_rating_question, mutation: Mutations::UpdateRatingQuestion
    field :delete_rating_question, mutation: Mutations::DeleteRatingQuestion

    field :login, LoginResult, null: false do
      argument :email, String, required: true
      argument :password, String, required: true
    end
    
    def login(email:, password:)
      user = User.find_by(email: email)
      return unless user
      user.authenticate(password)
      
      payload = { id: user.id, email: user.email }
      
      token = JWT.encode payload, ENV["HMAC_SECRET"], 'HS256'

      # login details
      { user_id: user.id, email: user.email, token: token }
    end
  end
end
