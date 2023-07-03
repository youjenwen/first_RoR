require './burger'

RSpec.describe Burger do
  it 'has a type' do
    burger = Burger.new('Beef', 'Cheddar')
    expect(burger.meat).to eq('Beef')
    expect(burger.cheese).to eq('Cheddar')
  end
end
