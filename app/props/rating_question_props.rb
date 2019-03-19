class RatingQuestionProps
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
          url: to_url(rating_question)
        }
    }
  end

  def to_url(rating_question)
    "/rating_questions/#{rating_question.id}" 
  end

end
