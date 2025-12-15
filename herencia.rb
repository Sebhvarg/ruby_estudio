class Animal
  def initialize(nombre)
    @nombre = nombre
  end

  def hablar
    "Hace un sonido"
  end
end

class Perro < Animal
  def initialize(nombre, raza)
    super(nombre)
    @raza = raza
  end

  def hablar
    "#{@nombre} dice: Guau!"
  end
end

class Gato < Animal
  def initialize(nombre, color)
    super(nombre)
    @color = color
  end

p = Perro.new("Rocky", "Labrador")
puts p.hablar
