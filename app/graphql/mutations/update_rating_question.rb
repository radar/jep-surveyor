module Mutations
  class UpdateRatingQuestion < Mutations::BaseMutation
    argument :id, ID, required: true
    argument :title, String, required: true
    
    type Types::MutateRatingQuestionResult

    def update_question(id:, title:)
      rating_question = RatingQuestion.find(id: id)
      rating_question.title = title
      rating_question.save
      rating_question
    end
  end
end