require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/activity'

class ActivityTest < Minitest::Test
  def test_it_has_a_name
    activity = Activity.new('hiking')

    assert_equal 'hiking', activity.name
  end

  def test_it_has_participants
    activity = Activity.new('hiking')

    assert activity.participants
  end

  def test_it_can_add_participants
    activity = Activity.new('hiking')

    assert activity.participants.empty?

    activity.add_participant('William', 0)

    assert ({'William' => 0.00}), activity.participants
  end

  def test_you_can_add_multiple_participants
    activity = Activity.new('roller skating')
    activity.add_participant('William', 5.00)
    activity.add_participant('Sabrina', 5.00)
    activity.add_participant('Ella', 7.00)

    assert_equal 3, activity.participants.count
  end

  def test_it_can_evaluate_the_total_cost_of_an_activity
    activity = Activity.new('roller skating')
    activity.add_participant('William', 5.00)
    activity.add_participant('Sabrina', 5.00)
    activity.add_participant('Ella', 7.00)

    assert_equal 17.00, activity.total_cost
  end

  def test_total_cost_starts_at_0
    activity = Activity.new('hiking')

    assert_equal 0, activity.total_cost
  end
end
