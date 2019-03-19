require "rails_helper"

RSpec.describe "Creating questions" do
  let!(:question) { RatingQuestion.create!(title: "is rails great?") }
  it "creates a new question" do
    visit "/"
    # fill_in "Title", with: "Is Capybara Cool?"
    # click_button "Add"

    within("[data-automation-id=questions-list]") do
      expect(page).to have_content("is rails great?")
    end
  end

  # it "cannot create a new question without a title"
end
