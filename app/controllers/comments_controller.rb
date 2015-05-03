class CommentsController < ApplicationController
	before_action :authenticate_user!
	before_action :set_annotation_comment, only: [:edit, :update, :destroy]
	
	def create
		@annotation = current_user.annotations.find(params[:annotation_id])
		@comment = @annotation.comments.create(params[:comment].permit(:name, :body))
		@comment.user_id = current_user.id
		redirect_to annotation_path(@annotation)
	end

	def edit

	end

	def update
		if @comment.update(params[:comment].permit(:name, :body))
			redirect_to @annotation
		else
			render 'edit'
		end
	end

	def destroy
		@comment.destroy

		redirect_to annotation_path(@annotation)
	end

	private
	def set_annotation_comment
		@annotation = current_user.annotations.find(params[:annotation_id])
		@comment = @annotation.comments.find(params[:id])	
	end

end
