require 'jwt'

module Types
  class MutationType < Types::BaseObject
    field :create_question, MutateRatingQuestionResult, null: false do
      argument :title, String, required: true
      argument :survey_id, ID, required: true      
    end

    field :delete_question, QuestionType, null: false do
      argument :id, ID, required: true
    end

    field :update_question, MutateRatingQuestionResult, null: false do
      argument :id, ID, required: true
      argument :title, String, required: true
    end

    field :login, LoginResult, null: false do
      argument :email, String, required: true
      argument :password, String, required: true
    end

    

    def create_question(title:, survey_id:)
      survey = Survey.find(survey_id: survey_id)
      rating_question = survey.rating_questions.create(title: title)
    end

    def delete_question(id:)
      rating_question = RatingQuestion.find(id: id)
      rating_question.destroy
      rating_question
    end

    def update_question(id:, title:)
      rating_question = RatingQuestion.find(id: id)
      rating_question.title = title
      rating_question.save
      rating_question
    end

    def login(email:, password:)
      user = User.find_by(email: email)
      return unless user
      user.authenticate(password)
      
      
      payload = { id: user.id, email: user.email }
      
      token = JWT.encode payload, ENV["HMAC_SECRET"], 'HS256'
      puts "TOKEN"
      puts token

      decoded_token = JWT.decode token, ENV["HMAC_SECRET"], true, { algorithm: 'HS256' }
      puts "DECODED TOKEN"
      puts decoded_token

      { email: user.email, token: token, user_id: user.id }
    end


  end
end
