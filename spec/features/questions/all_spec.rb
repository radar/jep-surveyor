require "rails_helper"
require "pry-byebug"
RSpec.describe "Show a question" do
  before {
    @question_1 = RatingQuestion.create!(title: "hola")
    @question_2 = RatingQuestion.create!(title: "holla")
    @question_3 = RatingQuestion.create!(title: "hollla")
  }

  it "lists all questions" do
    visit "/"
    within(".questions") do
      expect(page).to have_content(@question_1.title)
      expect(page).to have_content(@question_2.title)
      expect(page).to have_content(@question_3.title)
    end
  end
end
