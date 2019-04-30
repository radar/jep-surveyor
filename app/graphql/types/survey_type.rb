module Types
  class SurveyType < Types::BaseObject
    field :title, String, null: false
    field :id, String, null: false
  end
end