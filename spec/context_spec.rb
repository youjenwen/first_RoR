# context 可以取代 describe，不過多數都喜歡用在 describe 裡面

RSpec.describe '#even? method' do
  #當你使用 context 時，請用 when with without 來做開頭
  context 'with even number?' do
    it 'should return true' do
      expect(6.even?).to eq(true)
    end
  end

  context 'with odd number?' do
    it 'should return false' do
      expect(9.even?).to eq(false)
    end
  end
end
