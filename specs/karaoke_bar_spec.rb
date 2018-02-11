require('minitest/autorun')
require_relative('../karaoke_bar')
require_relative('../guest')
require_relative('../room')
require_relative('../song')

class TestKaraokeBar < MiniTest::Test
  def setup
    @bar = KaraokeBar.new("The Mercury", 10.00)

  end

def test_check_bar_has_name
  assert_equal("The Mercury", @bar.name())
end

end
