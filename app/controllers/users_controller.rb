class UsersController < ApplicationController
	before_action :authenticate_user!
	before_action :set_users, only: [:show, :follow, :unfollow]

	def index
		@users = User.all.order('created_at DESC')
	end

	def show

	end

	def follow
		@user_follower.follow(@user_followable)
		redirect_to user_path
	end

	def unfollow
		@user_follower.stop_following(@user_followable)
		redirect_to user_path

	end

	private
	def set_users
		@user_follower = current_user
		@user_followable = User.find(params[:id])
	end
end
