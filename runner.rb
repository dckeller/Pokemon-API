url = URI("http://pokeapi.co/api/v2/pokemon/16/")

http = Net::HTTP.new(url.host, url.port)

request = Net::HTTP::Get.new(url)

response = http.request(request)
name =          JSON.parse(response.read_body)['name']
height =        JSON.parse(response.read_body)['height']
weight =        JSON.parse(response.read_body)['weight']
id =            JSON.parse(response.read_body)['id']
type =          JSON.parse(response.read_body)['types'][0]['type']['name']
hp =            JSON.parse(response.read_body)['stats'][5]['stat']['name']
base_hp =       JSON.parse(response.read_body)['stats'][5]['base_stat']
attack =        JSON.parse(response.read_body)['stats'][4]['stat']['name']
base_attack =   JSON.parse(response.read_body)['stats'][4]['base_stat']
defense =       JSON.parse(response.read_body)['stats'][3]['stat']['name']
base_defense =  JSON.parse(response.read_body)['stats'][3]['base_stat']
speed =         JSON.parse(response.read_body)['stats'][0]['stat']['name']
base_speed =    JSON.parse(response.read_body)['stats'][0]['base_stat']


puts "Pokemon: #{name.capitalize} ID: #{id}"
puts "#{name.capitalize} is a #{type.capitalize} type Pokemon.  They usually have a height of #{height}', and weigh around #{weight} pounds."
puts "#{hp.upcase}: #{base_hp}"
puts "#{attack.capitalize}: #{base_attack}"
puts "#{defense.capitalize}: #{base_defense}"
puts "#{speed.capitalize}: #{base_speed}"
