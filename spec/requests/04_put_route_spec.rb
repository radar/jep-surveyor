require "rails_helper"

RSpec.describe "PUT /rating_questions.json/:id" do
  context "when the question exists" do
    let!(:question) do
      RatingQuestion.create(title: "Hello World")
    end

    it "returns a 200 OK" do
      put "/rating_questions/#{question.id}.json", params: {rating_question: {title: "Hello Mars"}}

      expect(response.status).to eq(200)
    end

    it "changes just the title attribute" do
      put "/rating_questions/#{question.id}.json", params: {rating_question: {title: "Hello Mars"}}
      question = JSON.parse(response.body)
      expect(question.is_a?(Hash)).to eq(true)
      expect(question["title"]).to eq("Hello Mars")
      expect(question.key?("tag")).to be true
    end
  end

  context "asking to PUT a question that doesn't exist" do
    it "returns a 404 Not Found" do
      put "/rating_questions/i-will-never-exist.json", params: {rating_question: {title: "hello"}}
      expect(response.status).to eq(404)
    end
  end
end
