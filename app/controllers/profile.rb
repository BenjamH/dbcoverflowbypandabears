get '/profiles/:user_id' do
  @user = User.find(params[:user_id])
  erb :profile
end
