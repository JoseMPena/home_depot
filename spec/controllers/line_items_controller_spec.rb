require 'rails_helper'

RSpec.describe LineItemsController, type: :controller do

  describe "GET #index" do
    it "assigns all line_items as @line_items" do
      line_item = LineItem.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(assigns(:line_items)).to eq([line_item])
    end
  end

end
