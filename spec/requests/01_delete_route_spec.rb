require "rails_helper"

RSpec.describe "DELETE /rating_questions.json/:id" do
  context "with an existing question" do
    let!(:question) do
      RatingQuestion.create(title: "Hello World")
    end

      it "returns a 204 No Content" do
      delete "/rating_questions/#{question.id}.json"

      expect(response.status).to eq(204)
    end

    it "returns nothing" do
      delete "/rating_questions/#{question.id}.json"

      expect(response.body.to_s).to eq("")
    end
  end

  context "asking to delete a question that doesn't exist" do
    it "returns a 404 Not Found" do
      delete("/rating_questions/i-will-never-exist.json")
      expect(response.status).to eq(404)
    end
  end
end
