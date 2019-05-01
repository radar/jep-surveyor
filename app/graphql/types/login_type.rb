module Types
  class LoginType < Types::BaseObject
    field :email, String, null: false
    field :password, String, null: false
  end
end