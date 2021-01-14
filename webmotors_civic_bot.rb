class WebmotorsCivicBot
  CATEGORY_URL = {
    webmotors: 'https://www.webmotors.com.br/carros/estoque/honda/civic/20-si-16v-gasolina-4p-manual?ab=mobilestick&tipoveiculo=carros&marca1=HONDA&modelo1=CIVIC&versao1=2.0%20SI%2016V%20GASOLINA%204P%20MANUAL&idcmpint=t1:c17:m07:ultimas-buscas:posicao-1::HONDA-CIVIC' #olx do brasil todo ordenado por mais recente
  }

#  def self.retrieve_info
#    hash_description = {}
#    count = 0
#
#    CATEGORY_URL.each do |site, url|
#
#      # PROBLEMA DE PERMISSAO OpenURI::HTTPError: 403 Forbidden
#      doc = Nokogiri::HTML(open(url))
#
#      #Pegando a lista de posts disponíveis na categoria
#      doc.search('.ContainerCardVehicle')
#      doc.css("#ad-list").search('.fnmrjs-2').map do |global_box|
#        global_box.search('.fnmrjs-4').map do |upper_box|
#          break if count > 8
#
#          upper_box.search('.fnmrjs-6').map do |title_box|
#            name = title_box.search('h2').text #nome do anuncio
#            distance_traveled = title_box.search('span').text.gsub(/[^0-9.]+/, '') # kilometragem total
#            count += 1
#
#            hash_description["Civic#{count}"] = "#{name} #{distance_traveled} Km"
#          end
#
#          upper_box.search('.fnmrjs-7').map do |price_box|
#            price_and_time = price_box.search('span').text
#
#            hash_description["Civic#{count}"] = "#{hash_description["Civic#{count}"]} #{price_and_time}"
#          end
#        end
#
#        global_box.search('.fnmrjs-5').map do |bottom_box|
#          break if count > 8
#
#          bottom_box.search('.sc-7l84qu-0').map do |location_box|
#            location = location_box.search('span').text
#
#            hash_description["Civic#{count}"] = "#{hash_description["Civic#{count}"]} #{location}"
#          end
#        end
#      end
#    end
#
#    hash_description
#  end
end
