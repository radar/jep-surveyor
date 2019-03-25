class SingleRatingQuestionProps
  attr_reader :rating_question

  def initialize(rating_question)
    @rating_question = rating_question
    @url = "http://localhost:3000/rating_questions"
  end

  def to_props
    {
      question: 
        {
          id: rating_question.id.to_s,
          title: rating_question.title,
        }
    }
  end
end