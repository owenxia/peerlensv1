class CommentsController < ApplicationController
	def create
		@annotation = Annotation.find(params[:annotation_id])
		@comment = @annotation.comments.create(params[:comment].permit(:name, :body))

		redirect_to annotation_path(@annotation)
	end

	def edit
		@annotation = Annotation.find(params[:annotation_id])
		@comment = @annotation.comments.find(params[:id])
	end

	def update
		@annotation = Annotation.find(params[:annotation_id])
		@comment = @annotation.comments.find(params[:id])

		if @comment.update(params[:comment].permit(:name, :body))
			redirect_to @annotation
		else
			render 'edit'
		end
	end

	def destroy
		@annotation = Annotation.find(params[:annotation_id])
		@comment = @annotation.comments.find(params[:id])
		@comment.destroy

		redirect_to annotation_path(@annotation)
	end

end
