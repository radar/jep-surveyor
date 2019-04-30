module Types
  class QueryType < Types::BaseObject
    field :questions, [QuestionType], null: true,
      description: "A list of questions"
    
      def questions
      RatingQuestion.all
    end

    field :surveys, [SurveyType], null: true,
      description: "A list of surveys"
    
      def surveys
      Survey.all
    end
  end
end