# Pokemon index action => GET /channels
get '/pokemon/pokemon' do # Controller
  @pokemons = Pokemon.all # Model
  erb :"/pokemon/pokemon" # View
end

##Pokemon show action => GET /channels/:id
get '/pokemon/show' do
  puts "---" * 20
  puts params
  @pokemon = Pokemon.find_by(params[:name])
  erb :"pokemon/show"
end
