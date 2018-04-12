require 'rubygems'
require 'nokogiri'
require 'open-uri'

page = Nokogiri::HTML(open("https://annuaire-des-mairies.com/95/vaureal.html"))

output = File.new('vaurel2.txt', 'w+')

page.xpath('//html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').each do |node|

output.write("L'adresse email de Vauréal est " + node)

end