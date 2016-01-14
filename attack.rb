Position = {'high'=>'h','low'=>'l'}

class Warrior
  attr_accessor :block, :health, :name, :deceased, :zombie
  def initialize(name)
    @name=name
    @health=100
    @block=""
    @deceased=false
    @zombie=false
  end

  def attack(enemy,position)
    damage = 0
    if enemy.block!=position then damage = position==Position['high'] ? 10 : 5 end

    if enemy.block=="" then damage += 5 end
    enemy.set_health(damage)
  end
  def set_health(damage)
    if @deceased && @health == 0 then @zombie=true end
    @health -= damage
    @health = @health < 0 ? 0 : @health
    if @health==0 then
      @deceased=true
      @zombie=false
    end
  end
end