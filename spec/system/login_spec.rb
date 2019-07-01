require "rails_helper"

RSpec.describe "login test" do
  def log_in_as(user)
    visit new_user_session_path
    fill_in("user_email", with: user.email)
    fill_in("user_password", with: user.password)
    click_button("commit")
  end

  let(:user) { create(:user) }

  it "allows a logged-in user to view the home page" do
    log_in_as(user)
    visit(root_path)
    expect(current_path).to eq(root_path)
  end
end
