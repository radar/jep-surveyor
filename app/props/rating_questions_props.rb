class RatingQuestionsProps
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
          url: to_url(rating_question)
        }
      end
    }
  end

  def to_url(rating_question)
    "/rating_questions/#{rating_question.id}" 
  end


end