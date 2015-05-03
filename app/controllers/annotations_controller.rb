class AnnotationsController < ApplicationController
	before_action :authenticate_user!

	load_and_authorize_resource

	def index
		@annotations = Annotation.all.order('created_at DESC')

	end

	def new
		@annotation = current_user.annotations.new
	end

	def show
		@annotation = Annotation.all.find(params[:id])

	end

	def create
		@annotation = current_user.annotations.new(annotation_params)
		if @annotation.save
			redirect_to @annotation
		else
			render 'new'
		end
	end

	def edit

	end

	def update
		if @annotation.update(annotation_params)
			redirect_to @annotation
		else
			render 'edit'	
		end
	end

	def destroy
		@annotation.destroy
		redirect_to annotations_path
	end


	private
	def annotation_params
		params.require(:annotation).permit(:quote, :note, :notebook_id)
	end

end
