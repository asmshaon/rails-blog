class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :check_session, only: [:new, :edit, :update, :destroy]

  respond_to :html

  def index
    @posts = Post.by_recent_order
    respond_with(@posts)
  end

  def show
    respond_with(@post)
  end

  def new
    @post = Post.new
    respond_with(@post)
  end

  def edit
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      respond_with(@post)
    else
      flash.now[:error] = @post.errors.full_messages
      respond_with(@post)
    end
  end

  def update
    @post.update(post_params)
    respond_with(@post)
  end

  def destroy
    Post.delay.destroy_post(params[:id])
    flash[:success] = 'Post deleted successfully'
    redirect_to :action => :index
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def check_session
    unless user_signed_in?
      redirect_to '/users/sign_in'
    end
  end

  def post_params
    params.require(:post).permit(:title, :body, :author)
  end
end
