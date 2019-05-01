class RatingQuestion
  include Mongoid::Document
  belongs_to :survey

  field :title, type: String

  # validates :survey_id, presence: true
end
