require 'rails_helper'
# require 'app/controllers/admin/products_controller'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here
    it 'test example should be valid' do
      @product = Product.new({
        name: 'something',
        price: 12.34,
        quantity: 3,
        category: Category.new
      })
      expect(@product.valid?).to be true
    end

    it 'test example should be invalid without name' do
      @product = Product.new({
        name: nil,
        price: 12.34,
        quantity: 3,
        category: Category.new
      })
      expect(@product.valid?).to be false
    end

    it 'test example should be invalid without price' do
      @product = Product.new({
        name: 'something',
        quantity: 3,
        category: Category.new
      })
      expect(@product.valid?).to be false
    end

    it 'test example should be invalid without quantity' do
      @product = Product.new({
        name: 'something',
        price: 12.34,
        quantity: nil,
        category: Category.new
      })
      expect(@product.valid?).to be false
    end

    it 'test example should be invalid without category' do
      @product = Product.new({
        name: 'something',
        price: 12.34,
        quantity: 3,
        category: nil
      })
      expect(@product.valid?).to be false
    end

    it 'test example should have retrievable data' do
      @product = Product.new({
        name: 'something',
        price: 12.34,
        quantity: 3,
        category: Category.new
      })
      expect(@product.name).to eq('something')
    end

    it 'test example should save' do
      @product = Product.new({
        name: 'something',
        price: 12.34,
        quantity: 3,
        category: Category.new
      })
      expect(@product.save!).to be true
    end
  end
end
