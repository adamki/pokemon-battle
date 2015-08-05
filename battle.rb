require './charizard'
require './magikarp'
require './pikachu'
require './blastoise'

class Battle

  def initialize
    @xp = 0
    @team = [battle_charizard = Charizard.new,
             battle_magikarp  = Magikarp.new]
    @current_pokemon = @team[0]

    @opponent_team = [battle_blastoise = Blastoise.new,
                      battle_pikachu   = Pikachu.new]
    @current_opponent = @opponent_team[0]
  end

  def start_game
    p "Please enter your name!"
    name = gets.chomp
    puts "#{name}, Welcome!"
    gets
    set_opponent
  end

  def set_opponent
    printf "ASH wants to Fight!\n"
    @current_opponent = @opponent_team.sample
    puts "ASH sent out #{@current_opponent.name}..."
    gets
  end

  def battle_intro
    puts "Go! #{@current_pokemon.name}!"
    gets
    puts "Please choose one of the following options:\n"
    puts "-Fight\n-PkMn\n-Run"
    user_choice = gets.chomp.downcase
    if user_choice == "fight"
      puts "\n"
      battle
    elsif user_choice == "run"
      run_away
    elsif user_choice == "pkmn"
      puts "What pokemon?"
      choose_pokemon
    else
      puts "Please put a valid input"
      battle_intro
    end
  end

  def fainted(pokemon)
    @hp = 0
    "#{pokemon.upcase} fainted!"
  end

  def battle
    attacks = @current_pokemon.attack_list.keys.each do |attack|
      puts attack
    end

    user_attack = gets.chomp.downcase

    if user_attack == attacks[0]
      damage = @current_pokemon.attack_list[user_attack]
      @current_opponent.hp -= damage
      puts "#{@current_pokemon.name} used #{attacks[0]} against #{@current_opponent.name}"
      gets
      puts "#{@current_opponent.name} lost #{damage} HP! #{@current_opponent.hp} left"
      opponent_turn
    elsif user_attack == attacks[1]
      damage = @current_pokemon.attack_list[user_attack]
      puts "#{@current_pokemon.name} used #{attacks[1]} against #{@current_opponent.name}"
      gets
      puts "#{@current_opponent.name} lost #{damage} HP! #{@current_opponent.hp} left"
      opponent_turn
    elsif user_attack == attacks[2]
      damage = @current_pokemon.attack_list[user_attack]
      puts "#{@current_pokemon.name} used #{attacks[2]} against #{@current_opponent.name}"
      gets
      puts "#{@current_opponent.name} lost #{damage} HP! #{@current_opponent.hp} left"
      opponent_turn
    elsif user_attack == attacks[3]
      damage = @current_pokemon.attack_list[user_attack]
      puts "#{@current_pokemon.name} used #{attacks[3]} against #{@current_opponent.name}"
      gets
      puts "#{@current_opponent.name} lost #{damage} HP! #{@current_opponent.hp} left"
      opponent_turn
    else
      puts "please enter a valid input."
      battle
    end
    if @current_opponent.hp <= 0
      fainted(@current_opponent.name)
      require "pry";binding.pry
    else
      opponent_turn
    end
  end
#is this good enought?

  def opponent_attack_choice
    rand 0..3
  end

  def opponent_turn
    attacks = @current_opponent.attack_list.keys
    opponent_attack = 0
    if opponent_attack == 0
      damage = @current_opponent.attack_list[attacks[opponent_attack]]
      @current_pokemon.hp -= damage
      puts "#{@current_opponent.name} used #{attacks[0]} against #{@current_pokemon.name}"
      gets
      puts "#{@current_pokemon.name} lost #{damage} HP!  #{@current_pokemon.hp} left"
    elsif opponent_attack == 1
      damage = @current_opponent.attack_list[attacks[opponent_attack]]
      @current_pokemon.hp -= damage
      puts "#{@current_opponent.name} used #{attacks[1]} against #{@current_pokemon.name}"
      gets
      puts "#{@current_pokemon.name} lost #{damage} HP!   #{@current_pokemon.hp} left"
    elsif opponent_attack == 2
      damage = @current_opponent.attack_list[attacks[opponent_attack]]
      @current_pokemon.hp -= damage
      puts "#{@current_opponent.name} used #{attacks[2]} against #{@current_pokemon.name}"
      gets
      puts "#{@current_pokemon.name} lost #{damage} HP!  #{@current_pokemon.hp} left"
    elsif opponent_attack == 3
      damage = @current_opponent.attack_list[attacks[opponent_attack]]
      @current_pokemon.hp -= damage
      puts "#{@current_opponent.name} used #{attacks[3]} against #{@current_pokemon.name}"
      gets
      puts "#{@current_pokemon.name} lost #{damage} HP!  #{@current_pokemon.hp} left"
    end
    if @current_pokemon.hp <= 0
      fainted(@current_pokemon.name)
    else
      battle
    end
  end

  def choose_pokemon
    puts "Which Pokemon would you like to use?"
    count = 1
    @team.each do |pokemon|
      puts "#{count}-#{pokemon.name}\n"
      count+= 1
    end
    user_choice = gets.chomp.to_i - 1
    @current_pokemon = @team[user_choice]
    puts "Your current pokemon is #{@current_pokemon.name}."
    opponent_turn
  end

  def run_away
    chance = rand 100
    if chance < 50
      puts "Can't Escape"
      opponent_turn
    else
      battle_summary
    end
  end

  def battle_summary
    puts "#{@current_pokemon.name} gained #{@xp} XP."
  end

end

if __FILE__==$0
  test_battle = Battle.new
  test_battle.start_game
  test_battle.battle_intro
end
