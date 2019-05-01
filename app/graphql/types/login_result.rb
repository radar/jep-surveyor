module Types
  class LoginResult < Types::BaseUnion
    possible_types SuccessfulLoginResult, FailedLoginResult

    def self.resolve_type(object, _context)
      unless object
        FailedLoginResult
      else
        SuccessfulLoginResult
      end
    end
  end
end