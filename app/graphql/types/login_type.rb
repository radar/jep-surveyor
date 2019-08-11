module Types
  class LoginType < Types::BaseObject
    field :email, String, null: false
    field :password, String, null: false
    field :token, string, null: false
  end
end