require './burger'

RSpec.describe Burger do
  # 如果我們都認為這個東西是所有 example 都需要使用也可以使用 let! method
  # 像是 before 一樣
  let!(:burger) { Burger.new('Pork', 'Cheddar') }

  it 'has cheese' do
    expect(burger.cheese).to eq('Cheddar')
    burger.cheese = 'Ricotta'
    expect(burger.cheese).to eq('Ricotta')
  end
  it 'has meat' do
    comparison = 'Beef'
    # 客製錯誤訊息
    expect(burger.meat).to eq(comparison), "我想要 #{comparison} 而不是 #{burger.meat}"
  end
end
