require "rails_helper"

describe Question do
  it "returns capitalized tilte" do
    question = Question.new title: "title"
    expect(question.capitalized_title).to eq "Title"
  end
end
