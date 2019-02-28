require "spec_helper"

RSpec.describe "PATCH /rating_questions.json/:id" do
  context "when the question exists" do
    it "returns a 200 OK" do
      post "/rating_questions.json", params: {rating_question: {title: "Hello World"}}
      question = JSON.parse(response.body)
      patch "/rating_questions/#{question["id"]}", params: {rating_question: {tag: "greetings"}}
      expect(response.status).to eq(200)
    end

    it "returns a question -- with an additional field" do
      post "/rating_questions.json", params: {rating_question: {title: "Hello World"}}
      question = JSON.parse(response.body)
      patch "/rating_questions/#{question["id"]}", params: {rating_question: {tag: "greetings"}}
      question = JSON.parse(response.body)

      expect(question.is_a?(Hash)).to eq(true)
      expect(question["title"]).to eq("Hello World")
      expect(question["tag"]).to eq("greetings")
    end
  end

  context "asking to get a question that doesn't exist" do
    it "returns a 404 Not Found" do
      patch "/rating_questions/i-will-never-exist", params: {rating_question: {title: "not here"}}
      expect(response.status).to eq(404)
    end
  end
end
