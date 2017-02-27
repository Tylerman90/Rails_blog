class ArticlesController < ApplicationController

	before_filter :load_article, :only => [:edit, :show, :update, :destroy]

	def index
		@articles = Article.all.order("Created_at DESC")
	end

	def show

	end

	def edit
		
	end

	def new
		@article = Article.new
	end

	def create
		@article = Article.create(article_params)
		if @article.save
			flash[:success] = "Article created!"
			redirect_to article_path(@article)
		else
			render 'new'
		end
	end

	def update
		if @article.update(article_params)
			flash[:success] = "Article updated!"
			redirect_to article_path(@article)
		else
			render 'edit'
		end
	end

	def destroy
		if @article.destroy
			flash[:success] = "Article deleted"
		else
			flash[:error] = "Something went wrong!"
		end
		redirect_to articles_path
	end

	private
	def article_params
		params.require(:article).permit(:title, :body)
	end

	def load_article
		@article = Article.find(params[:id])
	end
end
