require "rails_helper"

RSpec.describe "Creating questions" do
  it "creates a new question" do
    visit "/"
    fill_in "Title", with: "Is Capybara Cool?"
    click_button "Add"

    within("[data-automation-id=questions]") do
      expect(page).to have_content("Is Capybara Cool?")
    end
  end

  it "cannot create a new question without a title" do
    visit "/"
    click_link "New Question"
    fill_in "Title", with: ""
    click_button "Create Rating question"

    within(".flash-errors") do
      expect(page).to have_content("Your question has NOT been created.")
    end
  end
end
