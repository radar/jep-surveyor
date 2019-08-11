module Types
  class FailedLoginResult < Types::BaseObject
    field :errors, String, null: false

    def errors
      "Wrong Password"
    end
  end
end