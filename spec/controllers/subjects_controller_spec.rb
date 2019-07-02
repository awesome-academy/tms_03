require "rails_helper"

RSpec.describe Supervisor::SubjectsController, type: :controller do
  let(:supervisor) { create(:supervisor) }
  let!(:subject) { create(:subject) }
  let(:valid_attributes) {
   {title: "Lorem ipsum", description: "Lorem ipsum", creator: supervisor}
  }
  let(:invalid_attributes) {
    {title: "a" * 256, description: "Lorem ipsum", creator: supervisor}
  }

  before(:example) do
    sign_in(create(:supervisor))
  end

  describe "GET #index" do
    it "returns a success response" do
      get :index, params: {}
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {}
      expect(response).to be_successful
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      get :edit, params: {id: subject.to_param}
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Subject" do
        expect {
          post :create, params: {subject: valid_attributes}
        }.to change(Subject, :count).by(1)
      end

      it "redirects to the created subject" do
        post :create, params: {subject: valid_attributes}
        expect(response).to redirect_to(supervisor_subjects_url)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {subject: invalid_attributes}
        expect(response).to be_successful
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {title: "new title"}
      }

      it "updates the requested subject" do
        put :update, params: {id: subject.to_param, subject: new_attributes}
        subject.reload
        expect(subject.title).to eq("new title")
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        put :update, params: {id: subject.to_param, subject: invalid_attributes}
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested subject" do
      expect {
        delete :destroy, params: {id: subject.to_param}
      }.to change(Subject, :count).by(-1)
    end

    it "redirects to the subjects list" do
      delete :destroy, params: {id: subject.to_param}
      expect(response).to redirect_to(supervisor_subjects_url)
    end
  end
end
