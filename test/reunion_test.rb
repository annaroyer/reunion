require 'minitest'
require 'minitest/pride'
require 'minitest/autorun'
require './lib/reunion'
require './lib/activity'

class ReunionTest < Minitest::Test
  def test_it_has_a_location
    reunion = Reunion.new('South Carolina')

    assert_equal 'South Carolina', reunion.location
  end

  def test_it_has_activities
    reunion = Reunion.new('South Carolina')

    assert reunion.activities
  end

  def test_it_can_add_activities
    reunion = Reunion.new('South Carolina')
    assert reunion.activities.empty?
    activity_1 = Activity.new('hiking')
    activity_2 = Activity.new('roller skating')
    reunion.add_activity(activity_1)

    assert_equal 1, reunion.activities.count

    reunion.add_activity(activity_2)

    assert_equal 2, reunion.activities.count
  end

  def test_it_can_evaluate_the_total_cost_of_a_reunion
    reunion = Reunion.new('South Carolina')
    activity_1 = Activity.new('hiking')

    activity_2 = Activity.new('roller skating')
    activity_2.add_participant('William', 5.00)
    activity_2.add_participant('Sabrina', 8.00)
    activity_2.add_participant('Ella', 2.00)

    activity_3 = Activity.new('swimming')
    activity_3.add_participant('William', 10.00)
    activity_3.add_participant('Sabrina', 10.00)

    reunion.add_activity(activity_1)
    reunion.add_activity(activity_2)
    reunion.add_activity(activity_3)

    assert_equal 35.00, reunion.total_cost
  end

  def test_it_can_summarize_all_participant_balances
    reunion = Reunion.new('South Carolina')
    activity_1 = Activity.new('hiking')

    activity_2 = Activity.new('roller skating')
    activity_2.add_participant('William', 5.00)
    activity_2.add_participant('Sabrina', 8.00)
    activity_2.add_participant('Ella', 2.00)

    activity_3 = Activity.new('swimming')
    activity_3.add_participant('William', 15.00)
    activity_3.add_participant('Sabrina', 5.00)

    reunion.add_activity(activity_1)
    reunion.add_activity(activity_2)
    reunion.add_activity(activity_3)

    result = reunion.summarize_balance
    reunion.print_summary

    assert_equal 2.00, result['Sabrina']
    assert_equal -5.00, result['William']
    assert_equal 3.00, result['Ella']
  end
end
