require "rails_helper"

RSpec.describe "deletes a question" do
  before {
    @question_1 = RatingQuestion.create!(title: "hola")
  }
  context "question exists" do
    it "delets the question" do
      visit "/"
      within(".question") do
        click_button "Delete Question"
      end
      click_button "OK"

      within(".flash-notice") do
        expect(page).to have_content("Your question has been deleted.")
      end
      within(".question") do
        expect(page).to have_content("Your question has been deleted.")
      end
    end
  end
end
