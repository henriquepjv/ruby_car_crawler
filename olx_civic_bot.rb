class OlxCivicBot
  COUNT_LIMIT = 5
  CATEGORY_URL = {
    olx: 'https://www.olx.com.br/autos-e-pecas/carros-vans-e-utilitarios?ot=1&q=civic%20si&re=28&rs=25&sf=1' #olx do brasil todo ordenado por mais recente
  }

  def self.retrieve_info
    hash_description = {}
    count = 0
    links = []

    CATEGORY_URL.each do |site, url|
      doc = Nokogiri::HTML(open(url))

      #Pegando a lista de posts disponíveis na categoria
      doc.css("#ad-list").search('.fnmrjs-0').map do |link|
        links << link.attributes['href'].value
      end

      doc.css("#ad-list").search('.fnmrjs-2').map do |global_box|
        global_box.search('.fnmrjs-4').map do |upper_box|
          break if count > COUNT_LIMIT

          upper_box.search('.fnmrjs-6').map do |title_box|
            name = title_box.search('h2').text #nome do anuncio
            distance_traveled = title_box.search('span').text.gsub(/[^0-9.]+/, '') # kilometragem total
            count += 1

            hash_description["Civic#{count}"] = "#{name} #{distance_traveled} Km"
          end

          upper_box.search('.fnmrjs-7').map do |price_box|
            price_and_time = price_box.search('span').text

            hash_description["Civic#{count}"] = "#{hash_description["Civic#{count}"]} #{price_and_time}"
          end
        end

        global_box.search('.fnmrjs-5').map do |bottom_box|
          break if count > COUNT_LIMIT

          bottom_box.search('.sc-7l84qu-0').map do |location_box|
            location = location_box.search('span').text

            hash_description["Civic#{count}"] = "#{hash_description["Civic#{count}"]} #{location}"
          end
        end
      end
    end

    hash_description.map.with_index do |civic, index|
      value = "#{civic[1]} - #{links[index]}"
      { civic[0] => value }
    end
  end
end
