# Subscription create action => POST /subscriptions
post '/subscriptions' do
  @user = User.find(session[:user_id])
  @pokemon = Pokemon.find(params[:pokemon_id])

  @subscription = Subscription.new(user: @user, pokemon: @pokemon)
  if @subscription.save
    redirect 'user/profile'
  else
    status 422
    @pokemon = Pokemon.find(params[:pokemon_id])
    @errors = @subscription.errors.full_messages
    erb :'pokemon/show'
  end
end

# Subscriptions destroy action => DELETE /subscriptions/:id
delete '/subscriptions/:id' do
  subscription = Subscription.find(params[:id])
  if subscription[:user_id] == session[:user_id]
    subscription.destroy
    redirect 'user/profile'
  else
    status 403
    redirect '/'
  end
end
