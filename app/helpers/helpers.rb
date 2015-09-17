helpers do 
	def current_user
		@user = User.where(id: session[:user_id]).first if session[:user_id]
	end
end