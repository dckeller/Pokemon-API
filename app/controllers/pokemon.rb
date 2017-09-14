# Pokemon index action => GET /channels
get '/pokemon/pokemon' do # Controller
  @pokemon = Pokemon.all # Model
  erb :'pokemon/pokemon' # View
end

# # Pokemon show action => GET /channels/:id
# get '/pokemon/:id' do
#   @pokemon = Pokemon.find(params[:id])
#   erb :'pokemon/show'
# end
