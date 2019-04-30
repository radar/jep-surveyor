module Types
  class QuestionType < Types::BaseObject
    field :title, String, null: false
    field :id, String, null: false
    field :tag, String, null: true
  end
end