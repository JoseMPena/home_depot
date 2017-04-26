require 'rails_helper'

RSpec.describe LineItemsController, type: :controller do
  fixtures :products
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
  
  describe 'POST #create' do
    render_views
    it 'creates line item' do
      expect { post :create, product_id: products(:ruby).id }
        .to change { LineItem.count }.by(1)
      expect(response).to redirect_to store_path
    end

    it 'creates a line_item via ajax' do
      expect { xhr :post, :create, product_id: products(:ruby).id }
        .to change { LineItem.count }.by(1)
      expect(response).to have_http_status :success
    end
  end
end
