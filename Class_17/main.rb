#1. Variables
puts "Hello, Ruby"
puts("Sebastian")
puts(1,2,3,4)

$global_variable = 10
universidad = "UTEQ - Universidad Tecnica Estatal de Quevedo"
_123 = "Sebastian"
@edad = 23
# @@experiencia = 2
puts _123
puts universidad

#2. Constante

PI = 3.1416

PI = 3.14

puts PI

#3. Todo es un objeto
2.times { puts "Hola Mundo soy Ruby" }
puts 10.5.ceil
puts 10.5.floor
puts "ESPOL".crypt("123123123123")
puts true.nil?
#4. Nuevas estructuras de control
edad = 10
unless edad < 18
  puts "Eres mayor de edad"
else
  puts "Eres menor de edad"
end

until edad > 18
  puts "Tienes #{edad}"
  edad +=1
end

#5. Definir una clase
class Persona
  #6. Métodos de acceso
  attr_accessor :nombre, :edad
  attr_reader :cedula, :correo
  attr_writer :correo

  def initialize(nombre, edad, cedula, correo)
    @nombre = nombre
    @edad = edad
    @cedula = cedula
    @correo = correo
  end
end

#7. Crear un ojeto

persona1 = Persona.new("Sebastian", 23, "1104687890", "sebastian@example.com")
puts persona1.nombre
puts persona1.edad
puts persona1.cedula
puts persona1.correo

#8. Herencia
class Programador < Persona
  attr_accessor :lenguaje

  def initialize(nombre, edad, cedula, correo, lenguaje)
    super(nombre, edad, cedula, correo)
    @lenguaje = lenguaje
  end
  def imprimirMensaje 
    puts "Hola, soy #{nombre}, tengo #{edad} años y programo en #{lenguaje}."
  end
end

programador1 = Programador.new("Karla", 20, "1101234567", "ana@example.com", "Ruby")
puts programador1.imprimirMensaje

#9. Incluyendo módulos
require_relative 'calculator'


#10. Gemas