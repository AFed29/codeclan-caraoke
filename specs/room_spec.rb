require('minitest/autorun')
require_relative('../room')
require_relative('../guest')
require_relative('../song')

class TestRoom < MiniTest::Test
  def setup
    @room = Room.new("Prince", 2)
    @guest1 = Guest.new("Steve", 20.00)
    guest2 = Guest.new("Bob", 20.00)
    guest3 = Guest.new("Alan", 20.00)

    @group1 = [@guest1, guest2, guest3]

    @song1 = Song.new("Don't Stop Me Now", "Queen")
  end

  def test_check_room_has_name
    assert_equal("Prince", @room.name())
  end

  def test_check_room_has_size()
    assert_equal(2, @room.size())
  end

  def test_add_guest_to_room()
    @room.add_guest_to_room(@guest1)
    assert_equal(1, @room.guests().count())
  end

  def test_remove_guest_from_room()
    @room.add_guest_to_room(@guest1)
    @room.remove_guest_from_room(@guest1)
    assert_equal(0, @room.guests().count())
  end

  def test_add_group_of_guests()
    @room.add_group_of_guests_to_room(@group1)
    assert_equal(3, @room.guests().count())
  end

  def test_remove_group_of_guests()
    guest = Guest.new("Kate", 20.00)
    @room.add_guest_to_room(guest)
    @room.add_group_of_guests_to_room(@group1)
    @room.remove_group_of_guests_from_room(@group1)
    assert_equal(1, @room.guests().count())
  end

  def test_add_song_to_room()
    @room.add_song_to_room(@song1)
    assert_equal(1, @room.songs().count())
  end

  def test_remove_song_from_room()
    @room.add_song_to_room(@song1)
    @room.remove_song_from_room(@song1)
    assert_equal(0, @room.songs().count())
  end

  def test_reset_room()
    @room.add_group_of_guests_to_room(@group1)
    @room.add_song_to_room(@song)
    @room.reset_room()
    assert_equal(0, @room.songs().count())
    assert_equal(0, @room.guests().count())
  end
end
