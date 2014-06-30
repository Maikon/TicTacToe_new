require 'gui_display'
require 'qt'

describe GuiDisplay do
  it 'displays a window' do
    app = Qt::Application.new(ARGV)
    window = GuiDisplay.new
    expect(window).to be_kind_of(Qt::Widget)
  end
end
