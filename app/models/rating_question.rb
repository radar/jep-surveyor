class RatingQuestion
  include Mongoid::Document

  field :title, type: String
  field :tag, type: String
  field :url, type: String

  validates :title, presence: true
end
