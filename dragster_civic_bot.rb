class DragsterCivicBot
  CATEGORY_URL = {
    dragster: 'https://dragsterbrasil.com/classificados-busca.php?buscar=civic&tipo=' # dragster brasil filtro por civic
  }

  def self.retrieve_info
    hash_description = {}
    count = 0

    CATEGORY_URL.each do |site, url|
      doc = Nokogiri::HTML(open(url))

      #Pegando a lista de posts disponíveis na categoria
      doc.search('.classificados').map do |lists|
        lists.search('.anuncio2').each do |car|
          title = car.search('a').text
          count += 1

          hash_description["civic#{count}"] = title
        end
      end
    end

    hash_description
  end
end
