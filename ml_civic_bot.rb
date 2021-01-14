require 'byebug'
require "ostruct"

class MlCivicBot
  CATEGORY_URL = {
    ml: 'https://lista.mercadolivre.com.br/veiculos/carros-caminhonetes/honda/honda-civic-si_VEHICLE*BODY*TYPE_452758' # mercado livre todo ordenado por mais recente
  }

  def self.retrieve_info
    civic_list = []
    number_of_results = ''

    CATEGORY_URL.each do |site, url|
      doc = Nokogiri::HTML(open(url))

      #Pegando a lista de posts disponíveis na categoria
      number_of_results = doc.search('.ui-search-result__wrapper').count
      attributes = doc.search('li.ui-search-card-attributes__attribute').map { |element| element.text } # [year, km, year, km]
      price = doc.search('div.ui-search-item__group--price').map { |element| element.children.text }
      locations = doc.search('div.ui-search-item__group--location').map { |element| element.children.text }
      links = doc.search('a.ui-search-result__content.ui-search-link').map { |element| element['href'] }

      5.times do |index| # or with number_of_results
        distance = attributes.shift
        year = attributes.shift
        civic_list << "Link: #{links[index]}, \n Location: #{locations[index]}, \n Price: #{price[index]}, \n Km: #{distance}, \n Ano: #{year}"
      end

    end

    civic_list << "Civics anunciados: #{number_of_results}"
  end
end
