module Types
  class AccountType < BaseObject
    field :name, String, null: false
    field :surveys, [SurveyType], null: false
  end
end