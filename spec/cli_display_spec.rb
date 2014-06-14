require 'cli_display'

describe CliDisplay do
  it 'greets the players' do
    output = StringIO.new
    display = CliDisplay.new(output)
    display.greet_players
    expect(output.string).to eq "Welcome to Tic Tac Toe!\n"
  end
end
