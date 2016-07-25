class SearchesController < ApplicationController

  layout 'default'

  before_action :set_header_categories

  def create
    @search = Search.create(search_params)
    if @search.name.present?
      redirect_to action: :show, id: @search.id
    else
      flash[:error] = "Search Can't be blank"
      # redirect_to controller: "#{@search.controller_name}", action: "#{@search.action_name}"
      redirect_to root_path
    end
  end

  def show
    @results = SearchAlgorithm.new(params[:id]).results.first
  end

  private

  def search_params
    params.required(:search).permit(:name, :controller_name, :action_name)
  end

  def set_header_categories
    @categories = Category.all
  end

end