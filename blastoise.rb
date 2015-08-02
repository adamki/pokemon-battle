class Blastoise

  attr_accessor :name,
                :hp,
                :attack_list

  def initialize
    @name = "Blastoise"
    @hp = 100
    @type = ["water", "turtle"]
    @attack_list = {
      "watergun" => 20,
      "icebeam" => 70,
      "surf" => 95,
      "earthquake" => 15
    }
  end

  def check_hp
    @hp
  end

  def take_damage(pokemon, amount)
    if amount > check_hp
      fainted(pokemon)
    else
      @hp -= amount
    end
  end

  def restore_hp(pokemon, amount)
    @hp += amount
  end

  def fainted(pokemon)
    @hp = 0
    "#{pokemon.upcase} fainted!"
  end

  def attack(attack)

  end

  def learn_attack
    @attack_list << new_attack
    #will need to remove an attack from attack list
    #attack_list can not exceed 4
  end

end
