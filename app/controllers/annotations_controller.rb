class AnnotationsController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show] 
	before_action :set_annotation, only: [:edit, :update, :destroy]

	def index
		if user_signed_in?
			@annotations = current_user.annotations.order ('created_at DESC')
		else
			@annotations = Annotation.all.order ('created_at DESC')
		end
	end

	def new
		@annotation = current_user.annotations.build
	end

	def show
		if user_signed_in?
			@annotation = current_user.annotations.find(params[:id])
		else
			@annotation = Annotation.all.find(params[:id])
		end

	end

	def create
		@annotation = current_user.annotations.build(annotation_params)
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
