RSpec.describe 'before and after hooks' do
  before do
    p 'before hooks'
  end

  after do
    p 'after hooks'
  end

  it 'test for before & after' do
    p "inner example"
    expect(1 + 1).to eq(2)
  end
end
