require('minitest/autorun')
require_relative('../song')

class TestSong < MiniTest::Test
  def setup
    @song1 = Song.new("Take On Me", "a-ha")
  end

  def test_check_song_has_title()
    assert_equal("Take On Me", @song1.title())
  end

  def test_check_song_has_artist()
    assert_equal("a-ha", @song1.artist())
  end

end
