module Mutations
  class DeleteRatingQuestion < Mutations::BaseMutation
    argument :id, ID, required: true

    type Types::QuestionType

    def delete_question(id:)
      rating_question = RatingQuestion.find(id: id)
      rating_question.destroy
      rating_question
    end
  end
end