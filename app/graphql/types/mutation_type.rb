module Types
  class MutationType < Types::BaseObject
    
    field :create_question, CreateRatingQuestionResult, null: false do 
      argument :title,String, required: true
      argument :survey_id, ID, required: true
    end
    
    field :delete_question, DeleteRatingQuestionResult, null: false do 
      argument :id, ID, required: true
    end
 
    field :update_question, UpdateRatingQuestionResult, null: false do 
      argument :id, ID, required: true
      argument :title, String, required: false
      argument :tag, String, required: false
    end

    def create_question(title:,survey_id:)
      RatingQuestion.create(title: title,survey_id: survey_id)
    end

    def delete_question(id:)
      @question = RatingQuestion.find(id)
      if @question
        @question.destroy
        @question
      end
    end

    def update_question(title:,tag:, id:)
      @question = RatingQuestion.find(id)
      @question.title = title
      @question.tag = tag 
      @question.save
      @question
    end

  end
end
