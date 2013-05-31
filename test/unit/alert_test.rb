require 'test_helper'

class AlertTest < ActiveSupport::TestCase
  def setup
    @alert_one = alerts(:one)
    @alert_two = alerts(:two)
    @alert_three = alerts(:three)

    @user_one = users(:one)
  end

  test "creating a new alert creates an alert" do
    assert_kind_of Alert, Alert.new
  end

  test "should return false if has not been alerted" do
    assert !@alert_one.alerted?
  end

  test "should return true if has been alerted" do
    assert @alert_two.alerted?
  end

  test "should return alerts for user when asked" do
    assert !Alert.user_alerts(@user_one).empty?
  end

  #test "should only return alerts for correct user when asked" do
    # again, should test with actual user
    #assert Alert.user_alerts(@user_one).all? { |a| a == @user_one }
  #end
end
