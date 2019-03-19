module RatingQuestionsHelper
  def rating_question_props
    RatingQuestionProps.new(@rating_questions).to_props
  end

  def show_rating_question_props
    ShowRatingQuestionProps.new(@rating_question).to_props
  end
end
