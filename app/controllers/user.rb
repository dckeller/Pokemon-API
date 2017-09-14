# users new action => GET /users/new
get '/user/new' do
  @user = User.new
  erb :'user/new'
end

# users create action => POST /users
post '/user' do
  puts params
  @user = User.new(params[:user])
  if @user.save #success
    session[:user_id] = @user.id # logging in the brand new user
    redirect '/profile' # redirecting to their profile page
  else #failure
    status 422 # Telling the computer/browser something was wrong
    @errors = @user.errors.full_messages # Telling the human what went wrong
    erb :'user/new' # Re-render with errors, let them try again
  end
end

# Private users show action
get '/profile' do
  redirect '/login' unless logged_in?
  #puts session.inspect
  @user = current_user
  @user.inspect
  erb :'user/profile'
end

# Sessions new action => GET /sessions/new
get '/login' do
  @user = User.new
  erb :'user/login'
end

# Sessions create action => POST /sessions
post '/login' do
  puts params
  @user = User.authenticate(params[:email], params[:password])
  if @user
    session[:user_id] = @user.id
    redirect '/profile'
  else
    status 403
    @errors = ["Login failed"]
    erb :'user/login'
  end
end

# Sessions delete action => DELETE /sessions/:id
get '/logout' do
  # session.clear
  # session[:user_id] = nil
  session.delete(:user_id)
  redirect '/login'
end
