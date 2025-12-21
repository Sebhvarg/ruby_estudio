# ============================================ #
# Sebastian Holguin Vargas                     #
# ============================================ #
until cont>3 # Limite de 3 busquedas es como un while pero con negativo
puts 'Practicando Ruby' # Mensaje inicial en consola
require 'open-uri' # Permite abrir URLs como si fueran archivos
require 'nokogiri' # Libreria para parsear HTML/XML
require 'csv' # Manejo de archivos CSV

class Extractor
  attr_accessor :archivo, :url # Define getters y setters para archivo y url

  def initialize(archivo)
    @archivo = archivo # Guarda el nombre de archivo CSV a usar
  end

  def limpiar(archivo)
    CSV.open(archivo, 'w') do |csv| # Abre o crea CSV en modo escritura y lo vacia
    end
  end 

  def guardar(archivo, datos)
    CSV.open(archivo, 'a') do |csv| # Abre CSV en modo append para agregar filas
    csv << datos # Inserta una fila con los datos pasados
    end
  end

   def obtenerDatos(url, palabraClave)
    puts "Scrapeando #{url}..." # Indica que pagina se esta procesando
    confiesaloHTML = URI.open(url) # Descarga el HTML de la URL
    datos = confiesaloHTML.read # Lee el contenido como string
    parsed_content = Nokogiri::HTML(datos) # Parseo del HTML con Nokogiri
    datosContenedor = parsed_content.css('.infinite-container') # Selecciona el contenedor principal
    datosContenedor.css('.infinite-item').each do |confesiones| # Itera sobre cada item
      header = confesiones.css('div div.row').css('.meta__container--without-image').css('.row') # Busca cabecera con metadatos

      masInfo = confesiones.css('div.row').css('.read-more') # Busca los botones y contadores
      id_author = header.css('.meta__info').css('.meta__author').css('a').css('a:nth-child(3)').inner_text[1..-1] # Extrae id de autor

      author = header.css('.meta__info').css('.meta__author').at_css('a').inner_text[0..6] # Obtiene nombre corto del autor

      date = header.css('.meta__info').css('.meta__date').inner_text.strip.split(' ') # Divide la fecha en partes

      unless date[5].nil?
        strFecha = date[1] + ' ' + date[2] + ' ' + date[3][0..3] # crea fecha "Mes Dia Año"
        strHour = date[4] + ' ' + date[5] # Crea hora con sufijo am o pm
      else
        strFecha = nil # Si falta info, setea nulos
        strHour = nil
        end
      content = confesiones.css('div.row').css('.post-content-text').inner_text.gsub("\n", '') # Obtiene texto sin saltos de linea
      nrolikes = masInfo.css('span').css("#votosup-#{id_author}").inner_text # Likes del post
      nrodislikes = masInfo.css('span').css("#votosdown-#{id_author}").inner_text # Dislikes del post
      nroComentarios = rand(1..100) # Numero random para comentarios (placeholder)
      if content.include? palabraClave # Solo guarda si contiene la palabra clave
        guardar(archivo, [palabraClave, author.to_s, strFecha.to_s, strHour.to_s, nrolikes.to_i, nrodislikes.to_i, nroComentarios.to_i ,content.to_s]) # Escribe fila en CSV
      end
    end
     print "confesiones.csv actualizado \n" # Aviso de fin de pagina
   end
end

puts "Bienvenido al sistema para extraer confesiones" # Mensaje de bienvenida de consola
print "Ingrese nro páginas: " # Solicita cantidad de paginas a procesar
paginaFinal = gets().to_i # Lee el numero ingresado y lo convierte a entero
cont=1 # Contador paginas de busqueda
extractor = Extractor.new("confesiones.csv") # Instancia la clase con el archivo CSV
extractor.limpiar(extractor.archivo) # Limpa o crea el CSV
extractor.guardar(extractor.archivo, %w[Clave Autor Fecha Hora nrolikes nrodislikes nroComentarios texto]) # Escribe cabecera del CSV
until cont>3
  print "Ingrese palabra clave a buscar:" # Pide palabras clave para filtrar confesiones
  palabraClave = gets().strip # Lee la palabra clave sin espacios extremos
  paginaActual = 1 # Arranca en la primera pagina
  nroLinea = 1 # Variable sin uso aparente y queda inicializada
  while (paginaActual<=paginaFinal) # Recorre cada pagina indicada
      link = "https://confiesalo.net/?page=#{paginaActual}" # Construye URL de la pagina
      linea = extractor.obtenerDatos(link, palabraClave) # Ejecuta scraping para esa pagina
      paginaActual+=1 # Incrementa numero de pagina
  end
  cont+=1 # Incrementa contador de busquedas permitidas
end
puts "Nota: No comparta las confesiones... XD" # Mensaje final XDXDXDXDXD