# Ejecuta todos los ejemplos en orden con encabezados
files = %w[
  clases.rb
  attr_accessors.rb
  primitivos.rb
  variables_constantes.rb
  colecciones.rb
  control_until_unless.rb
  herencia.rb
  instancia.rb
  rails_info.rb
]

files.each_with_index do |f, i|
  path = File.join(__dir__, f)
  puts "\n=== (#{i+1}/#{files.size}) #{f} ==="
  if File.exist?(path)
    load path
  else
    warn "No se encontró: #{path}"
  end
end
