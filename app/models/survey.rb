class Survey
  include Mongoid::Document
  has_many :rating_question
  
  field :title, type: String
end
