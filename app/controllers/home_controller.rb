class HomeController < ApplicationController
  def index
    if params[:query].present?
      @posts = Post.search(params[:query], :load => true)
    else
      @posts = Post.by_recent_order
    end
  end
end