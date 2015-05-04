class SessionsController < ApplicationController
	def create
		#sraise env["omniauth.auth"].to_yaml
		user = User.from_omniauth(env["omniauth.auth"])		
		session[:user_id] = user.id
		redirect_to root_path, notice: "Signed in!"
	end

end