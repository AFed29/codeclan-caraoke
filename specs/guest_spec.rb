require('minitest/autorun')
require_relative('../guest')

class TestGuest < MiniTest::Test
  def setup
    @guest1 = Guest.new("Bob", 25.00)
  end

  def test_check_guest_has_name()
    assert_equal("Bob", @guest1.name())
  end

  def test_check_guest_has_wallet()
    assert_equal(25.00, @guest1.wallet())
  end

  def test_remove_money()
    @guest1.remove_money(5.00)
    assert_equal(20.00, @guest1.wallet())
  end

end
