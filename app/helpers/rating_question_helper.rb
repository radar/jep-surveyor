module RatingQuestionHelper  
  def rating_question_props
    RatingQuestionProps.new(@rating_question, rating_question_url(@rating_question)).to_props
  end
end