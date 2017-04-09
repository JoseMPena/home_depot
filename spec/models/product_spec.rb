require 'rails_helper'

RSpec.describe Product, type: :model do
  context 'with empty attributes' do
    subject { described_class.new }
    it 'should not be valid' do
      expect(subject).to_not be_valid
      expect(subject.errors[:title].any?).to be(true)
      expect(subject.errors[:description].any?).to be(true)
      expect(subject.errors[:price].any?).to be(true)
      expect(subject.errors[:image_url].any?).to be(true)
    end
  end

  context 'setting a price' do
    before(:all) do
      @product = Product.new(
        title: 'Test title',
        description: 'Test description',
        image_url: 'test_image.jpg'
      )
    end
    it 'should reject negative price' do
      @product.price = -1
      expect(@product).to_not be_valid
      expect(@product.errors[:price].join('; ')).to eq('must be greater than or equal to 0.01')
    end

    it 'should reject price as 0' do
      @product.price = 0
      expect(@product).to_not be_valid
      expect(@product.errors[:price].join('; ')).to eq('must be greater than or equal to 0.01')
    end

    it 'should accept positive price' do
      @product.price = 1
      expect(@product).to be_valid
      expect(@product.errors[:price].any?).to be(false)
    end
  end

  context 'setting an image url' do
    before(:all) do
      @product = Product.new(
        title: 'Test title',
        description: 'Test description',
        price: 1
      )
    end
    it 'accepts valid url' do
      valid = %w(test.gif test.jpg test.png TEST.JPG TesT.Jpg https://a.b.c/x/y/z.gif)
      valid.each do |url|
        @product.image_url = url
        expect(@product).to be_valid
      end
    end
    it 'rejects invalid url' do
      invalid = %w(test.doc test.gif/jpg test.gif.test)
      invalid.each do |url|
        @product.image_url = url
        expect(@product).to_not be_valid
      end
    end
  end
end
