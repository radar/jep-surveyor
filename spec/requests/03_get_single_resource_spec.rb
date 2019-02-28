require "rails_helper"

RSpec.describe "GET /rating_questions/:id.json" do
  context "when the question exists" do
    let!(:question) do
      RatingQuestion.create(title: "Hello World")
    end

    it "returns a 200 OK" do
      get("/rating_questions/#{question.id}.json")
      expect(response.status).to eq(200)
    end

    it "returns a question" do
      get("/rating_questions/#{question.id}.json")
      expect(JSON.parse(response.body).is_a?(Hash)).to eq(true)
    end
  end

  context "asking to get a question that doesn't exist" do
    it "returns a 404 Not Found" do
      get("/rating_questions/i-will-never-exist.json")
      expect(response.status).to eq(404)
    end
  end
end
