require('minitest/autorun')
require_relative('../karaoke_bar')
require_relative('../guest')
require_relative('../room')
require_relative('../song')

class TestKaraokeBar < MiniTest::Test
  def setup
    room1 = Room.new("MJ", 5)

    @bar = KaraokeBar.new("The Mercury", 10.00, [room1])
  end

  def test_check_bar_has_name()
    assert_equal("The Mercury", @bar.name())
  end

  def test_check_bar_has_entry_fee()
    assert_equal(10.00, @bar.entry_fee())
  end

  def test_check_bar_has_room()
    assert_equal(1, @bar.rooms().count())    
  end


end
