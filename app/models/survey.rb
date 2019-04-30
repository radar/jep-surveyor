class Survey
  include Mongoid::Document
  has_many :rating_questions, dependent: :destroy

  field :name, type: String
  
end