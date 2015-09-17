get '/users' do
  erb :'login/index'
end

#login page
get '/users/login' do
	erb :'login/login'
end

#activate the session
post '/users/session' do
  user = User.find_by_email(params[:email])
  if user.nil?
    redirect '/users/login'
  elsif user.password == params[:password]
    session[:user_id] = user.id
    redirect "/profiles/#{user.id}" 
  else
    redirect '/users/login'
  end
end

#new user page
get '/users/new' do
	erb :'login/new'
end

#create new user to db and go to session
post '/users' do
	user = User.new(params)
	if user.save
		session[:user_id] = user.id
    redirect "/profiles/#{user.id}" 
	else
		redirect "/users"
	end
end

#logout 
get '/users/logout' do
	session[:user_id] = nil
	redirect "/"
end
