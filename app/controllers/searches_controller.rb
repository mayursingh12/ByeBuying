class SearchesController < ApplicationController

  layout 'default'

  before_action :set_header_categories

  def create
    @search = Search.create(search_params)
    redirect_to action: :show, id: @search.id
  end

  def show
    @results = SearchAlgorithm.new(params[:id]).results.first
  end

  private

  def search_params
    params.required(:search).permit(:name)
  end

  def set_header_categories
    @categories = Category.all
  end

end