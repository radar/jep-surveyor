class RatingQuestion
  include Mongoid::Document
  belongs_to :survey

  field :title, type: String
end
