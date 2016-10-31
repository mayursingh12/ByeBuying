class BlogsController < ApplicationController

  before_action :set_categories

  before_action :set_blog, only: [:show]

  layout 'default'

  def index
    @blogs = Blog.all.order(:heading)
  end

  def show

  end

  private

  def set_blog
    @blog = Blog.find params[:id]
  end

end