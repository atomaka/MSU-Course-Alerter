require 'test_helper'

class AlertTest < ActiveSupport::TestCase
  def setup
    @alert_one = alerts(:one)
    @alert_two = alerts(:two)
    @alert_three = alerts(:three)

    @user_one = users(:one)
  end

  test "should create a new alert" do
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

  test "should only return alerts for correct user when asked" do
    assert Alert.user_alerts(@user_one).all? { |a| a.user_id == @user_one.id }
  end

  test "should return the full course name" do
    assert_equal @alert_one.course_name, "CSE 101"
  end
end
