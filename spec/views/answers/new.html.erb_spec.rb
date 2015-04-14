require 'rails_helper'

RSpec.describe "answers/new", :type => :view do
  before(:each) do
    assign(:answer, Answer.new(
      :question => nil,
      :title => "MyString",
      :description => "MyText"
    ))
  end

  it "renders new answer form" do
    render

    assert_select "form[action=?][method=?]", answers_path, "post" do

      assert_select "input#answer_question_id[name=?]", "answer[question_id]"

      assert_select "input#answer_title[name=?]", "answer[title]"

      assert_select "textarea#answer_description[name=?]", "answer[description]"
    end
  end
end
