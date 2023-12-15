class PostsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    @posts = Post.all 
  end

  def new 
    @post =Post.new
  end

  def create
    @post= Post.new(user_params)  

  end

  def edit
    @post =Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.present?
      @post.update(post_params)
      render json: (@post), status: :ok
    end
  end

  def show
    @post = Post.find(params[:id])
    render json: (@post), status: :ok
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      render json: (@post), status: :ok
    end
  end
  private
  def post_params
    params.require(:post).permit(:title, :body, :published_at, :user, :refernece, :image)
  end
end
end
