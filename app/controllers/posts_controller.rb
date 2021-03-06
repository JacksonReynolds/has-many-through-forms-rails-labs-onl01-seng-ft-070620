class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
    @users = User.all
  end

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
    @categories = Category.all
    @category = @post.categories.build
  end

  def create
    post = Post.new(post_params)
    if post.save
      redirect_to post
    else
      render 'posts/new'
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, category_ids:[], categories_attributes: [:name])
  end
end
