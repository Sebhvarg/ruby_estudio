PI = 3.14159

class Contador
  @@total = 0

  def initialize
    @valor = 0
  end

  def inc
    @valor += 1
    @@total += 1
  end

  def valor
    @valor
  end

  def self.total
    @@total
  end
end

a = Contador.new
a.inc
b = Contador.new
b.inc
b.inc
puts a.valor
puts b.valor
puts Contador.total
puts PI
