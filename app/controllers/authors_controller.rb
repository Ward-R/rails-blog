class AuthorsController < ApplicationController

  def new
    @author = Author.new
  end

  def create
    @author = Author.new(author_params)
    if @author.save
      redirect_to author_path(@author)
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def index
    @authors = Author.all
  end

  def show
    @author = Author.find(params[:id])
    @post = Post.new
  end

  private

  def author_params
    params.require(:author).permit(:name)
  end

end
