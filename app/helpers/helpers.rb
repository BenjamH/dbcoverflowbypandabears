helpers do
	def current_user
		@user = User.where(id: session[:user_id]).first if session[:user_id]
	end

  def user_same_author?
    session[:user_id] == @question.user.id
  end

  def logged_in?
    !session[:user_id].nil?
  end
end
