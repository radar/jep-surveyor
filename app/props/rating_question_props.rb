class RatingQuestionProps
  attr_reader :rating_question, :url

  def initialize(rating_question, url)
    @rating_question = rating_question
    @url = url
  end

  def to_props
    {
      question:
        {
          id: rating_question.id.to_s,
          title: rating_question.title,
          url: url
        }
    }
  end
end
