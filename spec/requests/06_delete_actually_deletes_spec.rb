require "spec_helper"

RSpec.describe "DELETE /rating_questions.json/:id" do
  context "with an existing question" do
    it "actually deletes the question" do
      post "/rating_questions.json", params: {rating_question: {title: "Hello World"}}
      question = JSON.parse(response.body)
      route = "/rating_questions/#{question["id"]}"
      delete(route)
      get(route)
      expect(response.status).to eq(404)
    end
  end
end
