class CommentsController < ApplicationController
	before_action :authenticate_user!
	load_and_authorize_resource

	def create
		@annotation = Annotation.all.find(params[:annotation_id])
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

end
