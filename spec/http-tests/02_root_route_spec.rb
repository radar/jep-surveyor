require "spec_helper"

RSpec.describe "GET /ratingQuestions.json" do
  it "returns a 200 OK" do
    get("/ratingQuestions.json")
    expect(last_response.status).to eq(200)
  end

  it "returns an array" do
    get("/ratingQuestions.json")
    expect(JSON.parse(last_response.body).is_a?(Array)).to eq(true)
  end
end
