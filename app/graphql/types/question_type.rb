module Types
  class QuestionType < Types::BaseObject
    field :title, String, null: false
    field :id, ID, null: false
    field :tag, String, null: true
    field :survey_id, ID, null: false
  end
end