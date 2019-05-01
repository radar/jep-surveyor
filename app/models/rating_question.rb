class RatingQuestion
  include Mongoid::Document
  belongs_to :survey

  field :title, type: String

  validates :survey_id, presence: true
  validates :title, presence: true
end
