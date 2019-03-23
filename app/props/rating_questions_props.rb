class RatingQuestionsProps
  include Rails.application.routes.url_helpers
  attr_reader :rating_questions

  def initialize(rating_questions)
    @rating_questions = rating_questions
  end

  def to_props
    {
      questions: @rating_questions.map do |rating_question|
        {
          id: rating_question.id.to_s,
          title: rating_question.title,
          url: rating_question_path(rating_question)
        }
      end,
      form_url: rating_questions_path

  
    }
  end
end