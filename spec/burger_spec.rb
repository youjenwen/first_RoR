require './burger'

RSpec.describe Burger do
  it 'has a type' do
    burger = Burger.new('Big mac')
    expect(burger.type).to eq('Big mac')
    # 期待漢堡的種類等於'Big mac'
  end
end
