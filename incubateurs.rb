require 'open-uri'
require 'nokogiri'
require 'rubygems'

def route_des_incubateurs
   #je crée un hash vide
   liste = Hash.new
   #je définis la page de référence
   pages = Nokogiri::HTML(open("http://www.alloweb.org/annuaire-startups/annuaire-incubateurs-startups/"))
   #je crée un tableau incubateurs et je vais chercher les données dans les liens inclus dans les span qui sont inclus dans les div incubator_list
   incubateurs = pages.css('.listing-row-title a')
   
   #Je boucle sur les nom de ce tableau et les converti en texte puis les merge dans le hash
   incubateurs.each do |nom|
      
      incubateur = nom.text 
      liste.merge!(name: incubateur)

   #je crée un autre tableau incubateurs_site qui est lié à la même pags.css définie plus haut et je target le lien de la classe listing-row-image-link
   incubateurs_site = pages.css('a.listing-row-image-link')

      #je vais chercher les href de ces liens et je merge le tableau site_web avec le hash liste
      incubateurs_site.each do |site|
        site_web = site['href']
        liste.merge!(site: site_web)
      end
      #j'affiche tout ça
      puts liste
    end
end

route_des_incubateurs