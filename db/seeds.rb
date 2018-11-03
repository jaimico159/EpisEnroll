# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require 'nokogiri'

html = open('http://extranet.unsa.edu.pe/sisacad/visualiza_fechas_2018b.php').read
document = Nokogiri::HTML(html)


document.search('tr').map do |element| 
   if element.inner_text.downcase.include? "sistemas"

      dates = element.search('td')
      date1 = Date.parse(dates[1].inner_text)
      date2 = Date.parse(dates[2].inner_text)
      date3 = Date.parse(dates[3].inner_text)

      Clasifications.delete_all

      Clasifications.create(value: 1, name: "Primer tercio", start_date: date1, finish_date: date2, description: "", status: :active)
      Clasifications.create(value: 2, name: "Segundo tercio", start_date: date2, finish_date: date3, description: "", status: :active)
      Clasifications.create(value: 3, name: "Tercio tercio", start_date: date3, finish_date: date3 + 5, description: "", status: :active)

      #de la pagina de la universidad saque las fechas de las matriculas pero para los cachimbos no estoy seguro de donde sacarlos
      Clasifications.create(value: 4, name: "Cachimbos", start_date: date3 + 5, finish_date: date3 + 3, description: "", status: :active)

      break
   end
end
