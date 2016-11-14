class RatingsController < ApplicationController

  layout 'default'

  before_action :set_categories
  before_action :set_product, only: [ :update_rating_average, :update_review_count]

  def new
    @product_type =  params[:product_type]
    @rating = Rating.new(
        rateable_id: params[:product_id],
        rateable_type: params[:product_id],
        user_id: params[:user_id]
    )
  end

  def create
    is_product = params[:rating][:is_product] == "Product" ? true : false

    @product = Product.where(admin_verified: true).find params[:rating][:rateable_id]

    if is_product
      product_Average =  @product.average_rating
      if product_Average ==  nil
        product_Average = 0.0
      end

      total_reviews = @product.customer_review
      if total_reviews ==  nil
        total_reviews = 0
      end

      current_average = ((product_Average * total_reviews)+ params[:rating][:number].to_i   ) / (total_reviews+1)
      total_reviews +=1
      product_Average =  current_average

      params[:total_reviews] = total_reviews
      params[:average_rating] = product_Average

       update_rating_average()
       update_review_count()




    else

    end

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
        :is_product
    )
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

end