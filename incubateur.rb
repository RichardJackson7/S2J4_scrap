

require 'rubygems'
require 'nokogiri'
require 'open-uri'

def route_des_incubateurs
   liste=Hash.new
   pages = Nokogiri::HTML(open("http://www.mon-incubateur.com/site_incubateur/incubateurs"))

   incubateurs = pages.css('#incubators_list span a')
   incubateurs.each {|nom|
       incubateur = nom.text
       
       puts incubateur
   }
end

route_des_incubateurs