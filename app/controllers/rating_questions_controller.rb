class RatingQuestionsController < ApplicationController
  
  before_action :find_question, only: [:show, :destroy, :edit, :update]

  def find_question
    @rating_question = RatingQuestion.find(params[:id])
    return head 404 unless @rating_question
  end

  def index
    @rating_questions = RatingQuestion.all
  end

  def new
    @rating_question = RatingQuestion.new
  end

  def create
    head 400 if !rating_question_params[:title]
 
    @rating_question = RatingQuestion.new(rating_question_params)

    if @rating_question.save
      respond_to do |format|
        format.html { redirect_to @rating_question, notice: "Your question has been created." }
        format.json { render 'show', status: 201 }
      end
    else
      errors = { 'errors' => @rating_question.errors.messages }

      respond_to do |format|
        
        format.html { redirect_to @rating_question, notice: errors }

        format.json { render json: errors, status: 422 }
      end
    end
  end

  def edit
    @rating_question = RatingQuestion.find(params[:id])
  end
  
  def show
  end

  def update
    @rating_question.update(rating_question_params)
    
    notice = "Your question has been updated"

    respond_to do |format|
      format.html { redirect_to @rating_question, notice: notice }

      format.json { render @rating_question, status: 200 }
    end
  end

  def edit
  end

  def destroy
    @rating_question.destroy
  end



  private
  def rating_question_params
    params.require(:rating_question).permit(:title, :tag)
  end
  

end
