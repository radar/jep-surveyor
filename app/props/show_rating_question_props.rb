class ShowRatingQuestionProps
    include Rails.application.routes.url_helpers
    attr_reader :rating_question
  
    def initialize(rating_question)
      @rating_question = rating_question
    end
  
    def to_props
      {
        question:
          {
            id: rating_question.id.to_s,
            title: rating_question.title,
            url: rating_question_path(rating_question, format: :json)
          }
      }
    end
end