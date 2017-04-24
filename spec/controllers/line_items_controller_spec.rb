require 'rails_helper'

RSpec.describe LineItemsController, type: :controller do
  let(:valid_attributes) {
    skip('Add a hash of attributes valid for your model')
  }

  let(:invalid_attributes) {
    skip('Add a hash of attributes invalid for your model')
  }
  
  let(:valid_session) { {} }
  
  describe "GET #index" do
    it 'assigns all line_items as @line_items' do
      line_item = LineItem.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(assigns(:line_items)).to eq([line_item])
    end
  end

end
