module Types
  class SuccessfulLoginResult < Types::BaseObject
    field :email, String, null: false
    field :token, String, null: false
  end
end