class RatingQuestion
  include Mongoid::Document

  field :title, type: String
  field :tag, type: String
end
