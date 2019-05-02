module Types
  class MutationType < Types::BaseObject
    field :createSurvey, SurveyType, null: false do
      argument :name, String, required: true
    end
    
    field :createQuestion, CreateRatingQuestionResult, null: false do
      argument :title, String, required: true
      argument :survey_id, ID, required: true
    end
    
    field :deleteQuestion, DeleteQuestionResult, null: false do
      argument :id, ID, required: true
    end

    field :updateQuestion, UpdateQuestionResult, null: false do
      argument :id, ID, required: true
      argument :title, String, required: true
    end
    
    field :login, LoginResult, null: false do
      argument :email, String, required: true
      argument :password, String, required: true
    end
    
    def create_survey(name:)
      Survey.create(name: name)
    end

    def create_question(survey_id:, title:) 
      RatingQuestion.create(survey_id: survey_id, title: title)
    end

    def delete_question(id:)
      begin
        @rating_question = RatingQuestion.find(id: id)
        if @rating_question
          @rating_question.destroy
          @rating_question
        end
      rescue Mongoid::Errors::DocumentNotFound => error
        error
      end
    end

    def update_question(id:, title:)
      @rating_question = RatingQuestion.find(id: id)
      @rating_question.update(title: title)
      @rating_question
    end

    def login(email:, password:)
      user = User.find_by(email: email)
      user.authenticate(password)
    end
  end
end
