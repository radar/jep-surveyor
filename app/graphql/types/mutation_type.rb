module Types
  class MutationType < Types::BaseObject
    
    field :create_question, CreateRatingQuestionResult, null: false do 
      argument :title,String, required: true
    end
    
    field :delete_question, DeleteRatingQuestionResult, null: false do 
      argument :id,ID, required: true
    end
 
    def create_question(title:)
      RatingQuestion.create(title: title)
    end

    def delete_question(id:)
      @question = RatingQuestion.where(id:id).to_a.first
      if @question
        @question.destroy
        @question
      end
    end

  end
end
