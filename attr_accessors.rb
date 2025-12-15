class Cuenta
  LIMITE_RETIRO = 500.0
  attr_accessor :nombre      # getter + setter automáticos
  attr_reader :numero        # solo getter automático
  attr_writer :pin           # solo setter automático
  attr_accessor :saldo       # getter + setter automáticos

  def initialize(numero, saldo_inicial, pin, nombre)
    @numero = numero
    @saldo  = saldo_inicial
    @pin    = pin
    @nombre = nombre
  end
 
end

c = Cuenta.new("123", 100.0, 1111, "Juan")
c.nombre = "Pedro"
puts "El nombre de la cuenta es #{c.nombre}"
puts c.numero
c.saldo += 50
c.pin = 2222
puts c.saldo
