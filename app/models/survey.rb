class Survey
  include Mongoid::Document
  has_many :rating_question, dependent: :destroy
  belongs_to :account
  
  field :name, type: String
end
