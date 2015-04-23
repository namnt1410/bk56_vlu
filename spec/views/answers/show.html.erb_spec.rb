require 'rails_helper'

RSpec.describe "answers/show", :type => :view do
  before(:each) do
    @answer = assign(:answer, Answer.create!(
      :question => nil,
      :title => "Title",
      :description => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
  end
end
