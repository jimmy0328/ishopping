require 'rails_helper'

RSpec.describe Product, :type => :model do

  it "create product" do
    # TODO use factory girl
    product = Product.create!({title: 'rspec test', description: 'rspec test', cost: 100, price: 100, display: true})
    expect(Product.last).to eq(product)
  end
end
