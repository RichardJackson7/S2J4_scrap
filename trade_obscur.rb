#inclure les bibliothèques open-uri, nokogiri
require 'open-uri'
require 'nokogiri'

def cryptocurrencies
	#création d'un hash
	list = Hash.new	
	#ouvrir le fichier html 
	#création de l'objet doc
	doc = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
	#on récupere dans currency_name la classe .currency-name-container du fichier html
	currency_name = doc.css(".currency-name-container")
	#on récupere dans currency_price la classe .price du fichier html
	currency_price = doc.css(".price")
	#on fait une iteration sur chaque element de currency_name
	#afin de recuperer et d'afficher les emails 
	currency_name.each do |name| 
		#dans name_output on recupere le nom de tous les currencies
		name_output = name.text
		#on fait une iteration sur chaque element de currency_price
		#afin de recuperer le prix de tous les currencies
		currency_price.each do |price|
			price_output = price.text
			#on fussione tout dans le hash list
			list.merge!(name: name_output, price: price_output)
		end	
		#afficher le hash 
		puts list
	end	
end	

cryptocurrencies