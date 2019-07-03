require 'rails_helper'

RSpec.describe "supervisor/subjects/edit", type: :view do
  let(:supervisor) { create(:supervisor) }
  before(:each) do
    @subject = assign(:subject, Subject.create!(
      title: "MyString",
      description: "MyText",
      creator: supervisor
    ))
  end

  it "renders the edit subject form" do
    render

    assert_select "form[action=?][method=?]", supervisor_subject_path(@subject), "post" do

      assert_select "input[name=?]", "subject[title]"

      assert_select "textarea[name=?]", "subject[description]"
    end
  end
end
