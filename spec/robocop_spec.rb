require 'robocop'

RSpec.describe Robocop do
  it "should beep" do
    d = Robocop.new
    expect(d.beep).to eq('beep boop')
  end
end
