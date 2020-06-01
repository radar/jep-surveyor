module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.
    field :account, AccountType, null: false

    field :user, UserType, null: false

    field :questions, [QuestionType], null: false

    field :survey, SurveyType, null: false do
      argument :survey_id, ID, required: true
    end

    field :surveys_for_current_account, [SurveyType], null: false

    def account
      user.account
    end

    def user
      context[:current_user]
    end

    def questions
      RatingQuestion.all
    end

    def survey(survey_id:)
      account.surveys.find(survey_id)
    end

    def surveys_for_current_account
      account.surveys
    end



  end
end

