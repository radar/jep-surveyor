module Types
  class MutationType < Types::BaseObject
    
    field :create_question, CreateRatingQuestionResult, null: false do 
      argument :title,String, required: true
    
    end

    def create_question(title:)
      RatingQuestion.create(title: title)
    end

    # def delete_question(id:)
    #   @question = RatingQuestion.find(params[:id])
    #   @question.destroy
    # end
  end
end
