require "rails_helper"

RSpec.describe "Update the question" do
  before {
    @question_1 = RatingQuestion.create!(title: "hola")
  }
  context "question exists" do
    it "update one questions" do
      visit "/rating_questions/#{@question_1["id"]}/edit"
      fill_in "Title", with: "Is Capybara Cool?"
      click_button "Update Rating question"
      within(".questions") do
        expect(page).to have_content("Is Capybara Cool?")
      end
      within(".flash-notice") do
        expect(page).to have_content("Your question has been updated.")
      end
    end
  end
  context "question doesn't exist" do
    it "returns 404" do
      visit "/rating_questions/doesntexist/edit"
      expect(page.status_code).to eq(404)
    end
  end
end
