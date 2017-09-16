# users new action => GET /users/new
get '/user/registration' do
  @user = User.new
  erb :'user/registration'
end

# users create action => POST /users
post '/user/registration' do
  puts params
  @user = User.new(params[:user])
  if @user.save #success
    session[:user_id] = @user.id # logging in the brand new user
    redirect '/user/profile' # redirecting to their profile page
  else #failure
    status 422 # Telling the computer/browser something was wrong
    @errors = @user.errors.full_messages # Telling the human what went wrong
    erb :'user/registration' # Re-render with errors, let them try again
  end
end

# Private users show action
get '/user/profile' do
  @user = User.find(session[:user_id])
  if session[:user_id] != nil ## Change this to redirect '/login' unless logged_in?
    erb :'user/profile'       ## Then add a if logged_in function to our pokemon
  else                        ## views, so we can view all our fav pokemon
    erb :'user/login'
  end
end

# Sessions new action => GET /sessions/new
get '/user/login' do
  @user = User.new
  erb :'user/login'
end

# Sessions create action => POST /sessions
post '/user/login' do
  puts params
  @user = User.authenticate(params[:email], params[:password])
  if @user
    session[:user_id] = @user.id
    redirect 'user/profile'
  else
    status 403
    @errors = ["Login failed"]
    erb :'user/login'
  end
end

# Sessions delete action => DELETE /sessions/:id
get '/user/logout' do
  # session.clear
  # session[:user_id] = nil
  session.delete(:user_id)
  redirect 'user/login'
end
