class AnnotationsController < ApplicationController
	def index
		@annotations = Annotation.all.order ('created_at DESC')
	end

	def new
	end

	def show
		@annotation = Annotation.find(params[:id])

	end

	def create
		@annotation = Annotation.new(annotation_params)
		@annotation.save
		redirect_to @annotation
	end

	def edit
	end

	def update
	end

	def destroy
	end


	private
	def annotation_params
		params.require(:annotation).permit(:quote, :note)
	end
end
