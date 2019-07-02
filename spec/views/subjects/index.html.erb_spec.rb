require 'rails_helper'

RSpec.describe "supervisor/subjects/index", type: :view do
  let(:supervisor) { create(:supervisor) }
  before(:each) do
    assign(:subjects, [
      Subject.create!(
        title: "Title",
        description: "MyText",
        creator: supervisor
      ),
      Subject.create!(
        title: "Title",
        description: "MyText",
        creator: supervisor
      )
    ])
  end

  it "renders a list of subjects" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
