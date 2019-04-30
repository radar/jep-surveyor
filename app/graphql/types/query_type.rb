module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :questions, [QuestionType], null: false

    field :survey, SurveyType, null: false do
      argument :survey_id, ID, required: true
    end

    def questions
      RatingQuestion.all
    end

    def survey(survey_id:)
      Survey.find(survey_id)
    end

  end
end

