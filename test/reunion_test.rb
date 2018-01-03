require 'minitest'
require 'minitest/pride'
require 'minitest/autorun'
require './lib/reunion'

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
    reunion.add_activity('hiking')

    assert reunion.activities.include?('hiking')
  end
end
