RSpec.describe 'before and after hooks' do
  before(:context) do
    p 'OUTER Before context'
  end

  before(:example) do
    p 'OUTER Before example'
  end

  it 'will pass' do
    expect(1 + 1).to eq(2)
  end

  context 'when it can pass' do
    before(:context) do
      p 'INNER Before context'
    end

    before(:example) do
      p 'INNER Before example'
    end

    it 'will pass too' do
      expect(2 + 2).to eq(4)
    end
  end
end

# 在 context 裡面的 example 也吃到了外面的 before hooks
