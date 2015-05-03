class NotebooksController < ApplicationController
	before_action :authenticate_user! 
	before_action :set_notebook, only: [:show, :edit, :update, :destroy]

	def index
		@notebooks = current_user.notebooks.order('CREATED_AT DESC')
	end

	def show

	end

	def new
		@notebook = current_user.notebooks.new

	end

	def create
		@notebook = current_user.notebooks.new(notebook_params)
		if @notebook.save
			redirect_to @notebook
		else
			render 'new'
		end
	end

	def edit

	end

	def update
		if @notebook.update(notebook_params)
			redirect_to @notebook
		else
			render 'edit'
		end
	end

	def destroy
		@notebook.destroy
		redirect_to notebooks_path
	end

	private
		def notebook_params
			params.require(:notebook).permit(:name, :description)
		end

		def set_notebook
			@notebook = current_user.notebooks.find(params[:id])
		end


end
