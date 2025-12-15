class Punto
  attr_accessor :x, :y
  def initialize(x, y)
    @x = x
    @y = y
  end
  def distancia_origen
    Math.sqrt(x*x + y*y)
  end
end

p = Punto.new(3, 4)
puts p.distancia_origen
