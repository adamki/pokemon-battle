require 'simplecov'
# SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require './pokemon'


class HealthTest < Minitest::Test

  def test_it_can_be_summoned
    battle = Health.new
    assert_equal 100, battle.check_hp
  end

  def test_it_can_take_damage
    battle = Health.new
    battle.take_damage("charizard", 40)
    assert_equal 60, battle.check_hp
  end

  def test_it_can_recieve_health
    battle = Health.new
    battle.take_damage("charizard", 40)
    battle.restore_hp("charizard", 15)
    assert_equal 75, battle.check_hp
  end

  def test_that_health_can_not_go_negative
    battle = Health.new
    battle.take_damage("charizard", 110)
    assert_equal 0, battle.check_hp
  end

  def test_it_can_faint
    battle = Health.new
    result = "CHARIZARD fainted!"
    assert_equal result, battle.take_damage("charizard", 101)
  end


end
