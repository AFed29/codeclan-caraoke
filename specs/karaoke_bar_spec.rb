require('minitest/autorun')
require_relative('../karaoke_bar')
require_relative('../guest')
require_relative('../room')
require_relative('../song')

class TestKaraokeBar < MiniTest::Test
  def setup
    @bar = KaraokeBar.new("The Mercury", 10.00)

  end


end
