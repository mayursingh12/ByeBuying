class UsersController < ApplicationController

  layout 'default'

  before_action :set_categories

  before_action :set_user

  def all
    @products = @user.products.where(admin_verified: true).where('end_at > ?', DateTime.now)
    @services = @user.services.where(admin_verified: true)
  end

  def wish_list
    if @user.present?
      @wish_list = @user.wish_list
      unless @wish_list.present?
        @wish_list = []
      # else
        # @wish_list = @wish_list
      end

      if params[:is_product] == 'true'
        @wish_list << "1-#{params[:wish_id]}"
      else
        @wish_list << "0-#{params[:wish_id]}"
      end

      # if params[:is_product] == 'true'
      #   @wish_list << {
      #       is_product: true,
      #       wish_id: params[:wish_id]
      #   }
      # else
      #   @wish_list << {
      #       is_product: false,
      #       wish_id: params[:wish_id]
      #   }
      # end

      # if params[:is_product] == 'true'
      #   @wish_list = "1-#{params[:wish_id]}"
      # else
      #   @wish_list = "0-#{params[:wish_id]}"
      # end


      if @user.update_attributes(wish_list: @wish_list)
        flash[:success] = 'Add successfully.'
        if params[:is_product] == 'true'
          redirect_to "/products/#{params[:wish_id]}"
        else
          redirect_to "/services/#{params[:wish_id]}"
        end
      else
        render status: :unprocessable_entity, json: {errors: @user.errors.full_messages.first}
      end
    else
      render status: :unprocessable_entity, json: {errors: ['not signed in.']}
    end
  end

  private

  def set_user
    @user = User.find params[:id]
  end

end