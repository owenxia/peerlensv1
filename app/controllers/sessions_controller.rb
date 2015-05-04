class SessionsController < ApplicationController
	def create
		# raise env["omniauth.auth"].to_yaml
		
		socialuser = User.from_omniauth(env["omniauth.auth"])	
		session[:name] = socialuser.name
		redirect_to root_path, notice: "Signed in, #{socialuser.name}!"
	end	

	def destroy
		session[:name] = nil
		redirect_to root_path, notice: "Signed out!"

	end

end