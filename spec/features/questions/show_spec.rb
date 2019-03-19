require "rails_helper"

RSpec.describe "has expected elements" do
  let!(:question) do
    RatingQuestion.create!(title: "something")
  end
  it "has all expected elements" do
    visit "/rating_questions/#{question.id}"
    expect(page).to have_selector("a[href='/rating_questions']")
    expect(page).to have_selector("h1[value='Single Question:']")
  end
end
