require_relative 'framework'
require 'pry-byebug'
require 'pry-rails'

Position = {'high'=>'h','low'=>'l'} #don't change this object!

class Warrior
  attr_accessor :block, :health
  def initialize(name)
    #each warrior should be created with a name and 100 health points
    @name=name
    @health=100
    #default guard is "", that is unguarded
    @block=""
  end

  def attack(enemy,position)
    binding.pry
    damage = 0
    #attacking high deals 10 damage, low 5
    #0 damage if the enemy blocks in the same position
    if enemy.block!=position then damage = position==Position['high'] ? 10 : 5 end
    #and even more damage if the enemy is not blocking at all

    if enemy.block=="" then damage += 5 end
    enemy.set_health(damage)
  end
  def set_health(damage)
    #cannot have negative values
    @health-=damage
    #if health goes to 0, the warrior is dead
    if @health==0 then
      @deceased=true
      @zombie=false
    end
    #if a dead warrior is hit again, he will count as a zombie!
    if @deceased then @zombie=true end
  end
end



Test.describe("First attack") do
ninja = Warrior.new('Hanzo Hattori')
samurai = Warrior.new('Ryoma Sakamoto')

samurai.block = 'l'
ninja.attack(samurai, 'h')
Test.it("Even the brave Ryoma Sakamoto was easily hit; in the full test we would better call the best japanese swordsman ever") do
Test.assert_equals(samurai.health, 90, 'Expected samurai health to equal 90, instead got '+samurai.health.to_s)
end
end