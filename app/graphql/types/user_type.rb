module Types
  class UserType < BaseObject
    field :email, String, null: false
    field :user_id, ID, null: false
  end
end