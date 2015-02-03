class HomeController < ApplicationController
  def index
    @posts = Post.by_recent_order
  end
end