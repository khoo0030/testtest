require 'rails_helper'

RSpec.describe Product, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  subject do
    product = Product.new
    product.name = 'new product'
    product.description = 'product description...'
    product
  end

  it 'tests for name' do
    expect(subject.name).to eql 'new product'
    expect(subject.description).to eql 'product description'
  end
end
