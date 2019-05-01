module Types
  class MutationType < Types::BaseObject
    field :createSurvey, SurveyType, null: false do
      argument :name, String, required: true
    end

    def create_survey(name:)
      Survey.create(name: name)
    end

    field :createQuestion, QuestionType, null: false do
      argument :title, String, required: true
      argument :survey_id, ID, required: true
    end

    def create_question(survey_id:, title:) 
      RatingQuestion.create(survey_id: survey_id, title: title)
    end

    field :deleteQuestion, QuestionType, null: false do
      argument :id, ID, required: true
    end

    def delete_question(id:)
      @rating_question = RatingQuestion.find(id: id)
      if @rating_question
        @rating_question.destroy
        @rating_question
      end
    end

    field :modifyQuestion, QuestionType, null: false do
      argument :id, ID, required: true
      argument :title, String, required: true
    end

    def modify_question(id:, title:)
      @rating_question = RatingQuestion.find(id: id)
      @rating_question.update(title: title)
      @rating_question
    end
  end
end
