require "rails_helper"

RSpec.describe "GET /rating_questions.json" do
  it "returns a 200 OK" do
    get("/rating_questions.json")
    expect(response.status).to eq(200)
  end

  it "returns an array" do
    get("/rating_questions.json")
    expect(JSON.parse(response.body).is_a?(Array)).to eq(true)
  end
end
