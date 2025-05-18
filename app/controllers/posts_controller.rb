class PostsController < ApplicationController

  def new

    @author = Author.find(params[:author_id])
    @post = Post.new
  end

  def create
    @author = Author.find(params[:author_id])
    @post = Post.new(author_params)
    @post.author = @author
    if @post.save

      redirect_to author_path(@post)
    else
      render 'authors/show', status: :unprocessable_entity
    end
  end

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @post = Post.new
  end

  private

  def author_params
    params.require(:post).permit(:title, :body, :published_at)
  end

end
