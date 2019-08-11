class RatingQuestionsController < ApplicationController
  def index
    @rating_questions = RatingQuestion.all
  end

  def new
    @rating_question = RatingQuestion.new
  end

  def create
    @rating_question = RatingQuestion.create(question_params)
    if @rating_question.save
      respond_to do |format|
        format.html { redirect_to "/", notice: "Your question has been created." }
        format.json { render :show, status: 201 }
      end
    else
      respond_to do |format|
        errors = {"errors" => @rating_question.errors.messages}
        format.html { redirect_to "/rating_questions/new", notice: "Must have a title" }
        format.json { render json: errors, status: 422 }
      end
    end
  end

  def edit
    @rating_question = RatingQuestion.find(params[:id])
  end

  def update
    @rating_question = RatingQuestion.find(params[:id])
    
    if @rating_question.update(question_params)
      respond_to do |format|
        format.html { redirect_to "/rating_questions", notice: "Your question has been updated." }
        format.json { render :show }
      end
    else
      respond_to do |format|
        errors = {"errors" => @rating_question.errors.messages}
        format.html { redirect_to "/rating_questions/edit", notice: "Must have a title" }
        format.json { render :edit , status: 422 }
      end
    end
  end

  def destroy
    @rating_question = RatingQuestion.find(params[:id])
    @rating_question.destroy
  end

  def show
    @rating_question = RatingQuestion.find(params[:id])
  end

  private

  def question_params
    params.require(:rating_question).permit(:title, :id)
  end
end
