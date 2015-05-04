class SessionsController < ApplicationController

	def create
		# raise env["omniauth.auth"].to_yaml
		
		socialuser = User.from_omniauth(env["omniauth.auth"])

		# How to manually sign in a user with Devise?
		# current_user = socialuser
		# sign_in(:user, socialuser)
		session[:name] = socialuser.name
		redirect_to root_path, notice: "Signed in, #{socialuser.name}!"
	end	

	def destroy
		session[:name] = nil
		redirect_to root_path, notice: "Signed out!"

	end

end