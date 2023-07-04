RSpec.describe 'before and after hooks' do
  before do
    p 'before hooks'
  end

  after do
    p 'after hooks'
    p @array
    p @array.clear
  end

  it 'test for before & after' do
    p 'inner example'
    @array = []
    p "Inner #{@array}"
    @array << '1'
    expect(1 + 1).to eq(2)
  end
end
