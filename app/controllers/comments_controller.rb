class CommentsController < ApplicationController
	before_action :authenticate_user!
	load_and_authorize_resource param_method: :comment_params

	def create
		@annotation = Annotation.all.find(params[:annotation_id])
		@comment = @annotation.comments.create(comment_params)
		@comment.user_id = current_user.id
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

end
