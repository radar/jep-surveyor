module Types
  class QueryType < Types::BaseObject
    field :questions, [QuestionType], null: false,
      description: "A list of questions"
    
    def questions
      RatingQuestion.all
    end

    field :surveys, [SurveyType], null: false,
      description: "A list of surveys"
    
    def surveys
      Survey.all
    end

    field :survey, [SurveyType], null: false do
      argument :id, ID, required: true,
      description: "A list of survey"
    end
    
    def survey(id:)
      Survey.find(id: id)
    end
  end
end