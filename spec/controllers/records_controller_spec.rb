require 'rails_helper'

RSpec.describe RecordsController, type: :controller do
  before do
    @artist = build_stubbed(:artist)
    allow(Artist).to receive(:find).and_return(@artist)
    allow(@artist).to receive(:id).and_return(2)
    @record = build_stubbed(:record, artist: @artist)
    allow(Record).to receive(:find).and_return(@record)
  end

  describe "GET #index" do
    before do
      records = [
        build_stubbed(:record),
        build_stubbed(:record)
      ]
      allow(Record).to receive(:all).and_return(records)
    end

    it "returns a success response" do
      get :index, params: {}
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      get :show, params: {id: @record.to_param}
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
      get :edit, params: {id: @record.to_param}
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      before do
        allow_any_instance_of(Record).to receive(:save).and_return(true)
      end
      it 'saves the new record in the database' do
        expect_any_instance_of(Record).to receive(:save)
        post :create,
             params: {
               record: attributes_for(:record)
             }
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {record: { title: "" }}
        expect(response).to be_successful
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      before { allow(@record).to receive(:update).and_return(@record) }

      it "updates the requested record" do
        expect(@record).to receive(:update)
        put :update, params: {id: @record,
                              record: { title: "pony party"} }

      end

      it "redirects to the record" do
        put :update, params: {id: @record,
                              record: { title: "pony party"} }
        expect(response).to redirect_to(@record)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        allow(@record).to receive(:update).and_return(nil)
        put :update, params: {id: @record.to_param, record: { title: "" }}
        expect(response).to be_successful
      end
    end
  end

  describe 'DELETE #destroy' do
    before do
      allow(Record).to receive(:find).and_return(@record)
      allow(@record).to receive(:destroy).and_return(true)
    end

    it 'deletes the record' do
      expect(@record).to receive(:destroy)
      delete :destroy,
             params: { organization_id: 2,
                       credential_set_id: 4,
                       id: @record }
    end

    it 'redirects to the records list' do
      delete :destroy,
             params: { organization_id: 2,
                       credential_set_id: 4,
                       id: @record }
      expect(response).to redirect_to(records_url)
    end
  end
end
