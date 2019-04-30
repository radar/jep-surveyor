module Types
  class QuestionType < BaseObject
    field :title, String, null: false
    field :id, ID, null: false
  end
end