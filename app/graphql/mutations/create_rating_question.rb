module Mutations
  class CreateRatingQuestion < Mutations::BaseMutation
    argument :title, String, required: true
    argument :survey_id, ID, required: true      
    
    type Types::MutateRatingQuestionResult


    def resolve(title:, survey_id:)
      survey = Survey.find(survey_id)
      rating_question = survey.rating_questions.create(title: title)
    end
  end
end