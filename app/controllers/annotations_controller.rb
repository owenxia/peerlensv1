class AnnotationsController < ApplicationController
	before_action :authenticate_user!
	before_action :set_annotation, only: [:show, :edit, :update, :destroy]

	def index
		@annotations = current_user.annotations.order('created_at DESC')

	end

	def new
		@annotation = current_user.annotations.new
	end

	def show

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
		params.require(:annotation).permit(:quote, :note)
	end

	def set_annotation
		@annotation = current_user.annotations.find(params[:id])
	end
end
