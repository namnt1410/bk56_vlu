require 'rails_helper'

RSpec.describe "answers/edit", :type => :view do
  before(:each) do
    @answer = assign(:answer, Answer.create!(
      :question => nil,
      :title => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit answer form" do
    render

    assert_select "form[action=?][method=?]", answer_path(@answer), "post" do

      assert_select "input#answer_question_id[name=?]", "answer[question_id]"

      assert_select "input#answer_title[name=?]", "answer[title]"

      assert_select "textarea#answer_description[name=?]", "answer[description]"
    end
  end
end
