class RatingsController < ApplicationController

  layout 'default'

  before_action :set_categories
  before_action :set_product, only: [ :update_rating_average, :update_review_count]
  before_action :set_Service, only: [ :update_rating_average_service, :update_review_count_service]


  def new
    @product_type =  params[:product_type]
    is_product = @product_type == "Product" ? true : false

    if(params[:user_id])
      @user =  User.find (params[:user_id])
    else
      @user =  User.find (params[:rating][:user_id])
    end

    if is_product
      @rating = Rating.new(
          rateable_id: params[:product_id],
          rateable_type: params[:product_type],
          user_id: params[:user_id],
          user_name: @user.name
      )
    else
      @rating = Rating.new(
          rateable_id: params[:service_id],
          rateable_type: params[:product_type],
          user_id: params[:user_id],
          user_name:@user.name

      )
    end



  end

  def create
    is_product = params[:rating][:is_product] == "Product" ? true : false


    if is_product
      @product = Product.where(admin_verified: true).find params[:rating][:rateable_id]
      product_Average =  @product.average_rating
      if product_Average ==  nil
        product_Average = 0.0
      end
      total_reviews = @product.customer_review
      if total_reviews ==  nil
        total_reviews = 0
      end
      current_average = ((product_Average * total_reviews)+ params[:rating][:number].to_i) / (total_reviews+1)
      total_reviews +=1
      product_Average =  current_average

      params[:total_reviews] = total_reviews
      params[:average_rating] = product_Average
      recommend_count =  @product.recommand_count
      if params[:rating][:recommand] == "1"
        if recommend_count ==  nil
          recommend_count = 0.0
        end
        params[:recommand_count] = recommend_count+1
        update_recommend_count()
      end
       update_rating_average()
       update_review_count()



      # Product.find()
      @rating = Rating.new(rating_params)
      @rating.is_product = is_product
      if @rating.save
        redirect_to root_path
      else
        params[:product_id] = params[:rating][:product_id]
        params[:product_id] = params[:rating][:product_id]
        params[:user_id] = params[:rating][:user_id]
        render action: :new
      end

    else
      @service = Service.where(admin_verified: true).find params[:rating][:rateable_id]

      service_Average =  @service.average_rating
      if service_Average ==  nil
        service_Average = 0.0
      end
      total_reviews = @service.customer_review
      if total_reviews ==  nil
        total_reviews = 0
      end
      current_average = ((service_Average * total_reviews)+ params[:rating][:number].to_i) / (total_reviews+1)
      total_reviews +=1
      service_Average =  current_average

      params[:total_reviews] = total_reviews
      params[:average_rating] = service_Average
      recommend_count =  @service.recommand_count
      if params[:rating][:recommand] == "1"
        if recommend_count ==  nil
          recommend_count = 0.0
        end
        params[:recommand_count] = recommend_count+1
        update_recommend_count_service()
      end
      update_rating_average_service()
      update_review_count_service()
      @rating = Rating.new(rating_params_service)
      @rating.is_product = is_product
      if @rating.save
        redirect_to root_path
      else
        params[:product_id] = params[:rating][:product_id]
        params[:product_id] = params[:rating][:product_id]
        params[:user_id] = params[:rating][:user_id]
        render action: :new
      end
    end

  end

  private

  def rating_params
    params.require(:rating).permit(
        :number,
        :rateable_id,
        :rateable_type,
        :user_id,
        :feedback,
        :recommand,
        :title,
        :is_product,
        :user_name
    )
  end
  def rating_params_service
    params.require(:rating).permit(
        :number,
        :rateable_id,
        :rateable_type,
        :user_id,
        :feedback,
        :title,
        :recommand,
        :is_product,
        :user_name
    )
  end

  def update_review_count_service
    if @service.update_attributes(customer_review: params[:total_reviews])
    #   flash[:success] = 'successfully updated'
    #   redirect_to action: :index
    # else
    #   render action: :edit
    end
  end

  def update_rating_average_service
    if @service.update_attributes(average_rating: params[:average_rating].to_f)
      flash[:success] = 'Rating successfully updated.'
      # redirect_to action: :show
    # else
    #   render action: :show
    end
  end

  def update_recommend_count_service
    if @service.update_attributes(recommand_count: params[:recommand_count].to_f)
      # flash[:success] = 'Rating successfully updated.'
      # redirect_to action: :show
      # else
      #   render action: :show
    end
  end
  def update_review_count
    if @product.update_attributes(customer_review: params[:total_reviews])
      #   flash[:success] = 'successfully updated'
      #   redirect_to action: :index
      # else
      #   render action: :edit
    end
  end

  def update_rating_average
    if @product.update_attributes(average_rating: params[:average_rating].to_f)
      flash[:success] = 'Rating successfully updated.'
      # redirect_to action: :show
      # else
      #   render action: :show
    end
  end

  def update_recommend_count
    if @product.update_attributes(recommand_count: params[:recommand_count].to_f)
      # flash[:success] = 'Rating successfully updated.'
      # redirect_to action: :show
      # else
      #   render action: :show
    end
  end
end