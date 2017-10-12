class ContentsController < ApplicationController
	def index
		@contents = Content.all
	end

	def new
		@content = Content.new
	end

	def create
		@content = Content.new(blog_param)
		@content.save
		redirect_to contents_path
	end

	def show
		@content = Content.find(params[:id])
	end

	def destroy
		Content.find(params[:id]).destroy
		redirect_to contents_path
	end

	def blog_param
		params.require(:content).permit(:title, :description, :name)
	end
end
