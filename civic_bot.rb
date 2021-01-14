require_relative 'olx_civic_bot'
require_relative 'dragster_civic_bot'
require_relative 'ml_civic_bot'
require 'nokogiri'
require 'open-uri'
require 'pp'

class BotRainMaker
  def self.build_response
    puts 'Resultados Mercado Livre'
    puts MlCivicBot.retrieve_info

    puts "\n"
    puts "\n"
    puts 'Resultados Dragster'
    #pp DragsterCivicBot.retrieve_info

    puts "\n"
    puts "\n"
    puts 'Resultados OLX'
    puts OlxCivicBot.retrieve_info
  end
end

pp BotRainMaker.build_response

#curl --location --request GET 'https://rapidoo.com.br/api/credit_risk/all_check/search_license_plate?license_plate=ECT9444&max_days=10' \
#--header 'Authorization: Bearer 8b75801a3e60bbced57083d337cf92813dcc53585ad86716f0b2d30a397bd9a7' \
#--header 'Cookie: __cfduid=d222af781493284ce6bb6076bff6e11a91571166236'

#[{"uf":"SP","cep":"3192060","ddd":null,"ddd1":null,"fone":null,"nome":"FRANCISCO JANCAUSKAS CANO","fone1":null,"marca":"HONDA/CIVIC SI","placa":"DQO0035","bairro":"VL ORATORIO","cidade":"SAO PAULO","numero":"337","chassis":"93HFA55507Z200072","renavam":"921295308","cpf_cnpj":"34556814847","endereco":"R FAROL PAULISTANO","combustivel":"GASOLINA","complemento":null,"ano_fabricacao":"2007"},
#{"uf":"SP","cep":"4236260","ddd":null,"ddd1":null,"fone":null,"nome":"WAGNER MOREIRA DA SILVA","fone1":null,"marca":"HONDA/CIVIC SI","placa":"DQO0035","bairro":"HELIOPOLIS","cidade":"SAO PAULO","numero":"468","chassis":"93HFA55507Z200072","renavam":"921295308","cpf_cnpj":"35996222809","endereco":"R CRISTO REDENTOR","combustivel":"GASOLINA","complemento":"BLM AP2","ano_fabricacao":"2007"},
#{"uf":"SP","cep":"7400000","ddd":null,"ddd1":null,"fone":null,"nome":"DIOGO DE CARVALHO NASCIMENTO VEIGA","fone1":null,"marca":"HONDA/CIVIC SI","placa":"DQO0035","bairro":"COND N HORIZONT","cidade":"ARUJA","numero":"210","chassis":"93HFA55507Z200072","renavam":"921295308","cpf_cnpj":"31092142886","endereco":"AL SATELITE","combustivel":"GASOLINA","complemento":null,"ano_fabricacao":"2007"},
#{"uf":"SP","cep":"7400000","ddd":null,"ddd1":null,"fone":null,"nome":"SUHEN SAAB RIMAN","fone1":null,"marca":"HONDA/CIVIC SI","placa":"DQO0035","bairro":"JORDANOPOLIS","cidade":"ARUJA","numero":"120","chassis":"93HFA55507Z200072","renavam":"921295308","cpf_cnpj":"17461027808","endereco":"RUA SAO JUDAS TADEU","combustivel":"GASOLINA","complemento":"B","ano_fabricacao":"2007"}]},"numeroConsulta":"1603805292625","banco_sociedades":null,"banco_dadosCadastrais":null}
