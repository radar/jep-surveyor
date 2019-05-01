class Survey
  include Mongoid::Document
  has_many :rating_question, dependent: :destroy
  
  field :name, type: String
end
