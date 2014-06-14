require 'board'

describe Board do
  it 'has a default grid' do
    expect(Board.new.grid).to eq [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end
end
