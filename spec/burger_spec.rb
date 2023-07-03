require './burger'

RSpec.describe Burger do

  before do
    p "Hello, this is before hooks"
    @burger = Burger.new('Beef', 'Cheddar')
  end

  it 'has cheese' do
    # burger = Burger.new('Beef', 'Cheddar')
    expect(@burger.cheese).to eq('Cheddar')
  end
  it 'has meat' do
    # burger = Burger.new('Beef', 'Cheddar')
    expect(@burger.meat).to eq('Beef')
  end
end
