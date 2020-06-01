module Types
  class FailedLoginResult < Types::BaseObject
    field :errors, String, null: false

    def errors
      "Invalid Email or Password."
    end
  end
end