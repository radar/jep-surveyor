module Types
  class SurveyType < BaseObject

    field :name, String, null: false
    field :id, ID, null: false
    field :rating_questions, [QuestionType], null: false

    def rating_questions
      object.rating_questions
    end
  end
end