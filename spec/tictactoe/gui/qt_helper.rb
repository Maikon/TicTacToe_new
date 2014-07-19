shared_context :qt_helper do
  before(:all) do
    app = Qt::Application.new(ARGV)
  end
end
