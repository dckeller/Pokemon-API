# Pokemon index action => GET /channels
get '/pokemon/pokemon' do # Controller
  @pokemons = Pokemon.all # Model
  erb :"/pokemon/pokemon" # View
end

##Pokemon show action => GET /channels/:id
get '/pokemon/show' do
  @user = User.find(session[:user_id])
  @pokemon = Pokemon.find_by(name: params[:name])
  @reviews = @pokemon.reviews

  if request.xhr?
    erb :"pokemon/_show", layout: false
  else
    erb :"pokemon/show"
  end
end
