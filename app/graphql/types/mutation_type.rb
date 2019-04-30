require 'pry-byebug'

module Types
  class MutationType < Types::BaseObject
    field :createQuestion, QuestionType, null: false do
      argument :title, String, required: true
    end
    
    def create_question(title:)
      RatingQuestion.create(title: title)
    end

    field :deleteQuestion, QuestionType, null: false do
      argument :id, String, required: true
    end

    def delete_question(id:)
      @rating_question = RatingQuestion.find(id: id)
      if @rating_question
        @rating_question.destroy
        { id: id }
      end
    end

    field :modifyQuestion, QuestionType, null: false do
      argument :id, String, required: true
      argument :title, String, required: true
    end

    def modify_question(id:, title:)
      @rating_question = RatingQuestion.find(id: id)
      @rating_question.update(title: title)
      { id: id, title: title }
    end
  end
end
