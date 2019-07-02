require 'rails_helper'

RSpec.describe "supervisor/subjects/new", type: :view do
  let(:supervisor) { create(:supervisor) }
  before(:each) do
    assign(:subject, Subject.new(
      title: "MyString",
      description: "MyText",
      creator: supervisor
    ))
  end

  it "renders new subject form" do
    render

    assert_select "form[action=?][method=?]", supervisor_subjects_path, "post" do

      assert_select "input[name=?]", "subject[title]"

      assert_select "textarea[name=?]", "subject[description]"
    end
  end
end
