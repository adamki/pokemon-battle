
class Battle

  attr_reader :name

  def initialize
    @xp = 0
  end

  def start_game
    p "Please enter your name!"
    name = gets.chomp
    puts "#{name} Welcome!"
    gets
    printf "ASH wants to Fight!"
    gets

    puts "
     --_                       _--
    ||\_\__                 __/_/||
    ||  \  \__...-----...__/  /  ||
    \\  _\_/    /     \    \_/_  //
     |_/       |       |       \_|
     /    __   /     _/    __    \
    /  .-~--~-.\    / ) .-~--~-.  \
   |   ||    || \____/  ||    ||   |
   |   `-_--_-'         `-_--_-'   |
   |      ~~               ~~      |
   |              ___              |
   |              `-'              |
    \ \_  \                /  _/  /
     \_ \_/                \_/  _/
       \___                 ___/
       ..--\__           __/--..
     .~    __-~~~-----~~~-__    ~.
    (__.--~                 ~--.__)"
    puts "ASH sent out JigglyPuff..."
    gets
  end

  def battle_intro
    puts "Go! Charizard!"
    gets
    puts "Please choose one of the following options:\n"
    puts "-Fight\n-Run\n-PkMn"
    user_choice = gets.chomp.downcase

    if user_choice == "fight"
      battle
    elsif user_choice == "run"
      battle_summary
    elsif user_choice == "pkmn"
      puts "What pokemon?"
      choose_pokemon
    else
      puts "Please put a valid input"
      battle_intro
    end
  end

  def battle

  end

  def battle_summary

    puts "Charizard gained #{@xp} XP points "
  end

end

if __FILE__==$0
  test_battle = Battle.new
  test_battle.start_game
  test_battle.battle_intro
end
