class Persona
  def initialize(nombre, edad)
    @nombre = nombre
    @edad = edad
  end

  def saludar
    "Hola, soy #{@nombre} y tengo #{@edad} años"
  end
end

p = Persona.new("Ana", 30)
puts p.saludar
