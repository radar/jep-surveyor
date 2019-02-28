class RatingQuestionsController < ApplicationController
  before_action :find_question, only: [:show, :destroy, :edit, :update]

  def index
    @rating_questions = RatingQuestion.all
  end

  def new
    @rating_question = RatingQuestion.new
  end

  def create
    @rating_question = RatingQuestion.new(question_params)
    if @rating_question.save
      # flash[:notice] = "Your question has been created."
      respond_to do |format|
        format.html { redirect_to "/", notice: "Your question has been created." }
        format.json { render json: serialize_question(@rating_question), status: 201 }
      end
    else
      respond_to do |format|
        errors = {"errors" => @rating_question.errors.messages}
        format.html { redirect_to "/", alert: "Your question was not save!" }
        format.json { render json: errors, status: 422 }
      end
    end
  end

  def show
    render json: serialize_question(@rating_question), status: 200
  end

  def edit
  end

  def update
    @rating_question.update(question_params)
    respond_to do |format|
      format.html { redirect_to "/", notice: "Your question has been updated." }
      format.json { render json: serialize_question(@rating_question), status: 200 }
    end
  end

  def destroy
    @rating_question.delete
    respond_to do |format|
      format.html { redirect_to "/", notice: "Your question has been deleted." }
      format.json { head 204 }
    end
  end

  private

  def question_params
    params.require(:rating_question).permit(:title, :tag)
  end

  def serialize_question(question)
    {
      id: question.id.to_s,
      title: question.title,
      tag: question.tag,
    }
  end

  def find_question
    @rating_question = RatingQuestion.find(params["id"])
    unless @rating_question
      head 404
      return
    end
  end
end
