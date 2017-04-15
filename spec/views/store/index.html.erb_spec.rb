require 'rails_helper'
require 'capybara/rspec'

RSpec.describe 'store/index.html.erb', type: :view do
  before :all do
    @products = Product.all
  end
  it 'renders the nav menu' do
    render
    rendered.should have_selector('.entry', count: @products.count)
    assert_select 'h3', @products.first.title
    assert_select '.price', /\$[,\d]+\.\d\d/
  end
end
