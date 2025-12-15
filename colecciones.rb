nums = [1, 2, 3]
nums << 4
puts nums.map { |x| x * 2 }.inspect

perfil = { nombre: "Luisa", edad: 25 }
perfil[:pais] = "MX"
puts perfil[:nombre]
puts perfil.key?(:edad)
puts perfil.inspect

r1 = (1..5)
r2 = (1...5)
puts r1.to_a.inspect
puts r2.include?(4)
puts r2.include?(5)
