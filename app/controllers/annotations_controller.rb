class AnnotationsController < ApplicationController
	def index
		@annotations = Annotation.all.order ('created_at DESC')
	end

	def new
		@annotation = Annotation.new
	end

	def show
		@annotation = Annotation.find(params[:id])

	end

	def create
		@annotation = Annotation.new(annotation_params)
		if @annotation.save
			redirect_to @annotation
		else
			render 'new'
		end
	end

	def edit
		@annotation = Annotation.find(params[:id])

	end

	def update
		@annotation = Annotation.find(params[:id])

		if @annotation.update(params[:annotation].permit(:quote, :note))
			redirect_to @annotation
		else
			render 'edit'	
		end
	end

	def destroy
		@annotation = Annotation.find(params[:id])
		@annotation.destroy

		redirect_to annotations_path
	end


	private
	def annotation_params
		params.require(:annotation).permit(:quote, :note)
	end
end
