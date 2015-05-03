class CommentsController < ApplicationController
	before_action :authenticate_user!
	load_and_authorize_resource
	
	# Apparently load_and_authorize_resources does not load @annotation
	before_action :set_annotation, only: [:edit, :update, :destroy]
	
	def create
		@annotation = Annotation.find(params[:annotation_id])
		@comment = @annotation.comments.create(comment_params)
		@comment.user_id = current_user.id
		@comment.save
		redirect_to annotation_path(@annotation)
	end

	def edit

	end

	def update
		if @comment.update(comment_params)
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
		def comment_params
			params.require(:comment).permit(:name, :body)
		end

		def set_annotation
		 	@annotation = Annotation.find(params[:annotation_id])
		end

end
