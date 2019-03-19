module RatingQuestionsHelper
  def rating_questions_props
    RatingQuestionsProps.new(@rating_questions).to_props
  end
end
