require 'rubygems' #On appelle les gems
require 'nokogiri' #On utilise nokogiri
require 'open-uri' #On écrit ça pour pouvoir choper une page online

def get_all_the_urls_of_val_doise_townhalls_with_emails
	#je cré un hash appelé liste
	liste = Hash.new
	#je détermine la page sur laquelle je scrappe les infos
	pages = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
	#je crée un fichier texte dans lequel je pourrais enregistrer mes infos si besoin
	mairies = File.new('mairies.txt', 'w+')

	#je crée un array qui contient les infos des liens liées à la classe .lientxt en CSS
	news_links = pages.css(".lientxt")

	#Je cré une boucle each qui va reprendre tous les liens de mon tableau new_links
	news_links.each do |link|
	#Je crée un array url pour créer mon lien entier et y associer le href de link à chaque tour de boucle.
	url = "http://annuaire-des-mairies.com" + link['href']
	#Je merge mon hash liste pour y créer une key et associer le hash URL comme valeur à cette key {key => ville1, }
	liste.merge!(key: url)
		#Je crée ensuite une autre boucle pour associer à cette key une certaine value qui contiendra un email
		link.each do |email| page = Nokogiri::HTML(open(url))
		#pour chaque link de la première fonction each, j'associe un array qui sera sont adresse email que je vais chercher à l'endroit ci dessous dans le site
	 	email = page.css("/html/body/div[1]/main/section[2]/div/table/tbody/tr[4]/td[2]").text
	 	#Je merge mon array email au hash liste {key => ville1, value: emailville1@gmail.com}
		liste.merge!(value: email)

		end
		#j'affiche mon hash
		puts liste	
		# --- > enleves le commentaire ci-dessous si tu veux ecrire la liste dans le fichier mairies.txt <---
		#mairies.write(" " + "#{liste}" + "\n")
	end
end

get_all_the_urls_of_val_doise_townhalls_with_emails

