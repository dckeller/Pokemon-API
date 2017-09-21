## List all Reviews
get '/review/reviews' do
  @user = User.find(session[:user_id])
  @pokemon = Pokemon.find(params[:pokemon_id])
  puts params "-------------------------------"
  @reviews = @pokemon.reviews

  # if @pokemon.reviews
  #   @reviews = @pokemon.reviews
  # else
  #   @reviews = []
  # end
    erb :'_reviews'
end

## Get new review form
get '/review/new' do
  @pokemon = Pokemon.find(params[:pokemon_id])
  puts params
  puts "------------------------------------"
  @review = Review.new
  erb :'review/new'
end

## Form new for reviews
post '/review/new' do
  @user = User.find(session[:user_id])
  puts params
  puts "------------------------------------"
  @pokemon = Pokemon.find(params[:pokemon_id])
  @review = Review.new(body: params[:body], user_id: @user.id, pokemon_id: @pokemon.id)
  if @review.save
    redirect '/pokemon/pokemon'
  else
    status 422
    @errors = ["Sorry, you need to fill out all parts"]
    redirect '/pokemon/pokemon'
  end
end

delete '/review/:id' do
  review = Review.find(params[:id])
  if review.user.id == session[:user_id]
    review.destroy
    redirect '/pokemon/pokemon'
  else
    @errors = ["Sorry, you did not write this review"]
    redirect '/pokemon/pokemon'
  end
end
