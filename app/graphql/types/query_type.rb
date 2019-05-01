module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :questions, [QuestionType], null: false

    field :survey, SurveyType, null: false do
      argument :survey_id, ID, required: true
    end

    # field :user, UserType, null: false do
    #   argument :email, String, required: true
    #   argument :password, String, required: true
    # end

    def questions
      RatingQuestion.all
    end

    def survey(survey_id:)
      Survey.find(survey_id)
    end

    # def user(email:, password:)
    #   User.find_by(email: email)
    # end

  end
end

