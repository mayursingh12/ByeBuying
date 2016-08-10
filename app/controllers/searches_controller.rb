class SearchesController < ApplicationController

  layout 'default'

  before_action :set_header_categories

  def create
    @search = Search.create(search_params)

    if request.format == 'application/json'
      if @search.name.present?
        redirect_to action: :show, id: @search.id
        render status: :ok, json: { id:  @search.id }
      else
        render status: :unprocessable_entity, json: { errors: "Can't blank" }
      end
    else
      if @search.name.present?
        redirect_to action: :show, id: @search.id
      else
        flash[:error] = "Search Can't be blank"
        # redirect_to controller: "#{@search.controller_name}", action: "#{@search.action_name}"
        redirect_to root_path
      end
    end

    # if @search.name.present?
    #   redirect_to action: :show, id: @search.id
    # else
    #   flash[:error] = "Search Can't be blank"
    #   # redirect_to controller: "#{@search.controller_name}", action: "#{@search.action_name}"
    #   redirect_to root_path
    # end
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