class BlogsController < ApplicationController

  layout 'default'

  def index
    @blogs = Blog.all
  end

end