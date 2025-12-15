class Cuenta
  attr_reader :numero
  attr_writer :pin
  attr_accessor :saldo

  def initialize(numero, saldo_inicial, pin)
    @numero = numero
    @saldo  = saldo_inicial
    @pin    = pin
  end
end

c = Cuenta.new("123", 100.0, 1111)
puts c.numero
c.saldo += 50
c.pin = 2222
puts c.saldo
