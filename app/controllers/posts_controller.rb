class PostsController < ApplicationController
  before_filter :load_categories

  def index
    @posts = Post.all
    @posts = @posts.search(params[:search]) if params[:search].present?
    @posts = @category.posts if @category.present?
    @posts = @posts.published

    respond_with @posts do |format|
      format.atom
    end

  end

  def show
    @post = Post.published.find(params[:id])
    respond_with @post
  end

protected
  def load_categories
    @categories = Category.all
    @category = Category.find(params[:category_id]) if params[:category_id]
  end
end