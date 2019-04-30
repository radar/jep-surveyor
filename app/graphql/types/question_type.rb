module Types
  class QuestionType < BaseObject

    field :title, String, null: false
    field :id, ID, null: false
    field :survey_id, ID, null: true
  end
end