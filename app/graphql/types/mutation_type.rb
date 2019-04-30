module Types
  class MutationType < Types::BaseObject
    field :create_question, MutateRatingQuestionResult, null: false do
      argument :title, String, required: true
      argument :survey_id, ID, required: true      
    end

    field :delete_question, QuestionType, null: false do
      argument :id, ID, required: true
    end

    field :update_question, MutateRatingQuestionResult, null: false do
      argument :id, ID, required: true
      argument :title, String, required: true
    end

    def create_question(title:, survey_id:)
      rating_question = RatingQuestion.create(title: title, survey_id: survey_id)
    end

    def delete_question(id:)
      rating_question = RatingQuestion.find(id: id)
      rating_question.destroy
      rating_question
    end

    def update_question(id:, title:)
      rating_question = RatingQuestion.find(id: id)
      rating_question.title = title
      rating_question.save
      rating_question
    end


  end
end
