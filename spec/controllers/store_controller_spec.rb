require 'rails_helper'

RSpec.describe StoreController, type: :controller do

  describe 'GET #index' do
    render_views
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end

    it 'has store.js.coffee is in place' do
      get :index
      assert_select '.store .entry > img', 3
      assert_select '.entry input[type=submit]', 3
    end
  end

end
