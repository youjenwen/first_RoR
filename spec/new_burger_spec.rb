require './new_burger'

RSpec.describe Burger do
  let(:burger) { Burger.new('Big') }

  it 'type will be Big' do
    expect(burger.type).to eq('Big')
  end

  context "when we did't give argument" do
    let(:burger) { Burger.new }
    # 利用重複通過測試
    # 如果沒寫會去第4行找 就會測試就會錯
    it 'type will be small' do
      expect(burger.type).to eq('small')
    end
  end
end
