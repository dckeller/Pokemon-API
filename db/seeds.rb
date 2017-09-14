$url = URI("http://pokeapi.co/api/v2/pokemon/16/")

http = Net::HTTP.new($url.host, $url.port)

request = Net::HTTP::Get.new($url)

$response = http.request(request)
$id =       JSON.parse($response.read_body)['id']
$name =     JSON.parse($response.read_body)['name']
$height =   JSON.parse($response.read_body)['height']
$weight =   JSON.parse($response.read_body)['weight']
$species =  JSON.parse($response.read_body)['types'][0]['type']['name']
$hp =       JSON.parse($response.read_body)['stats'][5]['base_stat']
$attack =   JSON.parse($response.read_body)['stats'][4]['base_stat']
$defense =  JSON.parse($response.read_body)['stats'][3]['base_stat']
$speed =    JSON.parse($response.read_body)['stats'][0]['base_stat']

150.times do
num = 0
$url = URI("http://pokeapi.co/api/v2/pokemon/#{num += 1}/")
  Pokemon.create(pokedex: "#{$id}", name: "#{$name}", height: "#{$height}", weight: "#{$weight}", species: "#{$species}", hp: "#{$hp}", attack: "#{$attack}", defense: "#{$defense}", speed: "#{$speed}")
end
