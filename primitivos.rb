i = 42
f = 3.14
s = "hola"
sym = :ready
t = true
n = nil
r = Rational(1,3)
c = Complex(2, 3)

puts [i.class, f.class, s.class, sym.class, t.class, n.class, r.class, c.class].map(&:to_s).join(", ")
puts "#{i}, #{f}, #{s}, #{sym}, #{t}, #{n.inspect}, #{r}, #{c}"
