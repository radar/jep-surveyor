class RatingQuestionsController < ApplicationController
  # respond_to :html, :js
  
  def index
    @rating_questions = RatingQuestion.all
  end

  def new
    @rating_question = RatingQuestion.new
  end

  def create
    @rating_question = RatingQuestion.new(rating_question_params)

    if @rating_question.save
      redirect_to @rating_question, notice: "Your question has been created."
      
    else
      render 'new'
    end
  end

  def edit
    @rating_question = RatingQuestion.find(params[:id])
  end
  
  def show
    @rating_question = RatingQuestion.find(params[:id])
    head 404 unless @rating_question
  end

  def update
    @rating_questions = rating_questions.find(params[:id])
  end

  def edit
    @rating_questions = rating_questions.find(params[:id])
  end

  def destroy
    rating_questions = rating_questions.find(params[:id])
  end



  private
  def rating_question_params
    params.require(:rating_question).permit(:title)
  end
  

end
