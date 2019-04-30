module Types
  class FailedCreateRatingQuestionResult < BaseObject
    field :error, String, null: true
  end

  def errors
    object.error.full_message
  end
end