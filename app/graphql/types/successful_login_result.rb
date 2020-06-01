module Types
  class SuccessfulLoginResult < BaseObject
    field :email, String, null: false
    field :token, String, null: false
    field :user_id, String, null: false
  end
end