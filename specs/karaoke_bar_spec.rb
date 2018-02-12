require('pry')
require('minitest/autorun')
require_relative('../karaoke_bar')
require_relative('../guest')
require_relative('../room')
require_relative('../song')

class TestKaraokeBar < MiniTest::Test
  def setup
    @guest1 = Guest.new("John", 25.00)
    @guest2 = Guest.new("Sam", 25.00)
    @guest3 = Guest.new("Alan", 25.00)
    @guest4 = Guest.new("Steven", 25.00)

    @group1 = [@guest1, @guest2, @guest3]

    @room1 = Room.new("MJ", 5)
    @room2 = Room.new("Sam & Dave", 3, [@guest1, @guest2, @guest3])

    song1 = Song.new("Bohemian Rhapsody", "Queen")
    song2 = Song.new("I'm Gonna Be (500 Miles)", "The Proclaimers")
    song3 = Song.new("Don't Stop Believing", "Journey")

    @bar = KaraokeBar.new("The Mercury", 200.00, 10.00, [@room1, @room2], [song1, song2, song3])
  end

  def test_check_bar_has_name()
    assert_equal("The Mercury", @bar.name())
  end

  def test_check_bar_has_till()
    assert_equal(200.00, @bar.till())
  end

  def test_check_bar_has_entry_fee()
    assert_equal(10.00, @bar.entry_fee())
  end

  def test_check_bar_has_rooms()
    assert_equal(2, @bar.rooms().count())
  end

  def test_bar_has_songs()
    assert_equal(3, @bar.songs().count())
  end

  def test_add_money_to_till()
    @bar.add_money_to_till()
    assert_equal(210.00, @bar.till())
  end

  def test_single_guest_checking_into_room__enough_space()
    @bar.guest_checking_into_room(@guest1, @room1)
    assert_equal(1, @room1.guests().count())
    assert_equal(210.00, @bar.till())
  end

  def test_single_guest_checking_into_room__no_space()
    @bar.guest_checking_into_room(@guest4, @room2)
    assert_equal(3, @room2.guests().count())
  end

  def test_single_guest_checking_into_room__cannot_afford
    guest = Guest.new("Bob", 5.00)
    @bar.guest_checking_into_room(guest, @room1)
    assert_equal(0, @room1.guests().count())
  end

  def test_guest_checking_out_of_room
    @bar.guest_checking_out_of_room(@guest1, @room2)
    assert_equal(2, @room2.guests().count())
  end

end
