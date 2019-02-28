require "rails_helper"

RSpec.describe "DELETE /rating_questions.json/:id" do
  context "with an existing question" do
    it "returns a 204 No Content" do
      post "/rating_questions.json", params: {rating_question: {title: "Hello World"}}
      question = JSON.parse(response.body)
      delete "/rating_questions/#{question["id"]}"

      expect(response.status).to eq(204)
    end

    it "returns nothing" do
      post "/rating_questions.json", params: {rating_question: {title: "Hello World"}}
      question = JSON.parse(response.body)
      delete "/rating_questions/#{question["id"]}"

      expect(response.body.to_s).to eq("")
    end
  end

  context "asking to delete a question that doesn't exist" do
    it "returns a 404 Not Found" do
      delete("/rating_questions/i-will-never-exist")
      expect(response.status).to eq(404)
    end
  end
end
