class CitiesController < ApplicationController

  def collection_by_state
   @cities = City.where(state_id: params[:id])
  end

end