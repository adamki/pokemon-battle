require './health'  # ~> LoadError: cannot load such file -- ./health

class Charizard

  attr_accessor :hp,
                :attack_list

  def initialize
    @hp = 100
    @type = ["fire", "flying"]
    @attack_list = {
      "Rage" => 20
      "Slash" => 70
      "FlameThrower" => 95
      "FireSpin" => 15
    }
  end

  def attack(attack)

  end

  def learn_attack
    @attack_list << new_attack
    #will need to remove an attack from attack list
    #attack_list can not exceed 4
  end

end


#Rage
#Slash
#FlameThrower
#fire spin

# ~> LoadError
# ~> cannot load such file -- ./health
# ~>
# ~> /Users/adamki/.rvm/rubies/ruby-2.2.1/lib/ruby/site_ruby/2.2.0/rubygems/core_ext/kernel_require.rb:54:in `require'
# ~> /Users/adamki/.rvm/rubies/ruby-2.2.1/lib/ruby/site_ruby/2.2.0/rubygems/core_ext/kernel_require.rb:54:in `require'
# ~> /Users/adamki/Turing/module1/week_4/pokemon-battle/pokemon.rb:1:in `<main>'
