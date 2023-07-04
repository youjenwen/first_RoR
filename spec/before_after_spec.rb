RSpec.describe 'before and after hooks' do
  before(:context) do
    p 'before context'
  end

  before(:example) do
    p 'before example'
  end

  after(:context) do
    p 'after context'
  end

  after(:example) do
    p 'after example'
  end

  it 'test for before & after' do
    expect(1 + 1).to eq(2)
  end
end

# context 會在整個測試前執行，也會在測試結束後執行
