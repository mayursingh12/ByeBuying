class SearchAlgorithm

  def initialize(search_id, max_price, min_price, rating, quantity, category_id, subcategory_id)

    # puts '==== Loading search from id'
    @search = Search.find(search_id)

    @min_price = min_price
    @max_price = max_price
    @rating = rating
    @quantity = quantity

    @category_id = category_id
    @subcategory_id = subcategory_id

    @results = []
  end

  def results
    search_arr = @search.name.split(' ')
    category_ids =  make_categories_results(search_arr)
    product_ids = (get_product_id_by_category(category_ids) + get_product_ids_by_search(search_arr)).uniq
    service_ids = (get_service_id_by_category(category_ids) + get_service_ids_by_search(search_arr)).uniq
    advertisement_ids = (get_advertisement_id_by_category(category_ids) +  get_advertisement_ids_by_search(search_arr)).uniq
    find_and_load_models(product_ids, service_ids, advertisement_ids)
  end

  private

  # def find_and_load_models(product_ids, service_ids, advertisement_ids)
  #   @results << {
  #       products: Product.where(id: product_ids, admin_verified: true).where('end_at > ?', DateTime.now),
  #       services: Service.where(id: service_ids, admin_verified: true).where('end_at > ?', DateTime.now),
  #       advertisements: Advertisement.where(admin_verified: true, id: advertisement_ids)
  #   }
  # end

  def find_and_load_models(product_ids, service_ids, advertisement_ids)
    if @category_id.present? and @subcategory_id.present?
      @results << {
          products: Product.where(id: product_ids, admin_verified: true).where('end_at > ?', DateTime.now).where('((per_hour_price > ? AND per_hour_price < ? OR per_hour_price = ? OR per_hour_price = ? ) OR (per_day_price > ? AND per_day_price < ? OR per_day_price = ? OR per_day_price = ? ) OR (per_week_price > ? AND per_week_price < ? OR per_week_price = ? OR per_week_price = ? ) OR (per_month_price > ? AND per_month_price < ? OR per_month_price = ? OR per_month_price = ?)) AND (quantity > ?) AND (rating > ?  or rating = ?) AND category_id = ? AND subcategory_id = ?', @min_price, @max_price, @min_price, @max_price, @min_price, @max_price, @min_price, @max_price, @min_price, @max_price, @min_price, @max_price, @min_price, @max_price, @min_price, @max_price, @quantity, @rating, @rating, @category_id, @subcategory_id).order('id DESC'),
          services: Service.where(id: service_ids, admin_verified: true).where('((per_hour_price > ? AND per_hour_price < ? OR per_hour_price = ? OR per_hour_price = ? ) OR (per_day_price > ? AND per_day_price < ? OR per_day_price = ? OR per_day_price = ? ) OR (per_week_price > ? AND per_week_price < ? OR per_week_price = ? OR per_week_price = ? ) OR (per_month_price > ? AND per_month_price < ? OR per_month_price = ? OR per_month_price = ?)) AND (rating > ? or rating = ?) AND category_id = ? AND subcategory_id = ?', @min_price, @max_price, @min_price, @max_price, @min_price, @max_price, @min_price, @max_price, @min_price, @max_price, @min_price, @max_price, @min_price, @max_price, @min_price, @max_price, @rating, @rating, @category_id, @subcategory_id).order('id DESC'),
          advertisements: Advertisement.where(admin_verified: true, id: advertisement_ids).where('category_id = ? AND subcategory_id = ?', @category_id, @subcategory_id)
      }
    elsif @category_id.present?
      @results << {
          products: Product.where(id: product_ids, admin_verified: true).where('end_at > ?', DateTime.now).where('((per_hour_price > ? AND per_hour_price < ? OR per_hour_price = ? OR per_hour_price = ? ) OR (per_day_price > ? AND per_day_price < ? OR per_day_price = ? OR per_day_price = ? ) OR (per_week_price > ? AND per_week_price < ? OR per_week_price = ? OR per_week_price = ? ) OR (per_month_price > ? AND per_month_price < ? OR per_month_price = ? OR per_month_price = ?)) AND (quantity > ?) AND (rating > ?  or rating = ?) AND category_id = ?', @min_price, @max_price, @min_price, @max_price, @min_price, @max_price, @min_price, @max_price, @min_price, @max_price, @min_price, @max_price, @min_price, @max_price, @min_price, @max_price, @quantity, @rating, @rating, @category_id).order('id DESC'),
          services: Service.where(id: service_ids, admin_verified: true).where('((per_hour_price > ? AND per_hour_price < ? OR per_hour_price = ? OR per_hour_price = ? ) OR (per_day_price > ? AND per_day_price < ? OR per_day_price = ? OR per_day_price = ? ) OR (per_week_price > ? AND per_week_price < ? OR per_week_price = ? OR per_week_price = ? ) OR (per_month_price > ? AND per_month_price < ? OR per_month_price = ? OR per_month_price = ?)) AND (rating > ? or rating = ?) AND category_id = ?', @min_price, @max_price, @min_price, @max_price, @min_price, @max_price, @min_price, @max_price, @min_price, @max_price, @min_price, @max_price, @min_price, @max_price, @min_price, @max_price, @rating, @rating, @category_id).order('id DESC'),
          advertisements: Advertisement.where(admin_verified: true, id: advertisement_ids).where('category_id = ?', @category_id)
      }
    elsif @subcategory_id.present?
    @results << {
        products: Product.where(id: product_ids, admin_verified: true).where('end_at > ?', DateTime.now).where('((per_hour_price > ? AND per_hour_price < ? OR per_hour_price = ? OR per_hour_price = ? ) OR (per_day_price > ? AND per_day_price < ? OR per_day_price = ? OR per_day_price = ? ) OR (per_week_price > ? AND per_week_price < ? OR per_week_price = ? OR per_week_price = ? ) OR (per_month_price > ? AND per_month_price < ? OR per_month_price = ? OR per_month_price = ?)) AND (quantity > ?) AND (rating > ?  or rating = ?) AND subcategory_id = ?', @min_price, @max_price, @min_price, @max_price, @min_price, @max_price, @min_price, @max_price, @min_price, @max_price, @min_price, @max_price, @min_price, @max_price, @min_price, @max_price, @quantity, @rating, @rating, @subcategory_id).order('id DESC'),
        services: Service.where(id: service_ids, admin_verified: true).where('((per_hour_price > ? AND per_hour_price < ? OR per_hour_price = ? OR per_hour_price = ? ) OR (per_day_price > ? AND per_day_price < ? OR per_day_price = ? OR per_day_price = ? ) OR (per_week_price > ? AND per_week_price < ? OR per_week_price = ? OR per_week_price = ? ) OR (per_month_price > ? AND per_month_price < ? OR per_month_price = ? OR per_month_price = ?)) AND (rating > ? or rating = ?) AND subcategory_id = ?', @min_price, @max_price, @min_price, @max_price, @min_price, @max_price, @min_price, @max_price, @min_price, @max_price, @min_price, @max_price, @min_price, @max_price, @min_price, @max_price, @rating, @rating, @subcategory_id).order('id DESC'),
        advertisements: Advertisement.where(admin_verified: true, id: advertisement_ids).where('subcategory_id = ?', @subcategory_id)
    }
    else
      @results << {
          products: Product.where(id: product_ids, admin_verified: true).where('end_at > ?', DateTime.now).where('((per_hour_price > ? AND per_hour_price < ? OR per_hour_price = ? OR per_hour_price = ? ) OR (per_day_price > ? AND per_day_price < ? OR per_day_price = ? OR per_day_price = ? ) OR (per_week_price > ? AND per_week_price < ? OR per_week_price = ? OR per_week_price = ? ) OR (per_month_price > ? AND per_month_price < ? OR per_month_price = ? OR per_month_price = ?)) AND (quantity > ?) AND (rating > ?  or rating = ?)', @min_price, @max_price, @min_price, @max_price, @min_price, @max_price, @min_price, @max_price, @min_price, @max_price, @min_price, @max_price, @min_price, @max_price, @min_price, @max_price, @quantity, @rating, @rating).order('id DESC'),
          services: Service.where(id: service_ids, admin_verified: true).where('((per_hour_price > ? AND per_hour_price < ? OR per_hour_price = ? OR per_hour_price = ? ) OR (per_day_price > ? AND per_day_price < ? OR per_day_price = ? OR per_day_price = ? ) OR (per_week_price > ? AND per_week_price < ? OR per_week_price = ? OR per_week_price = ? ) OR (per_month_price > ? AND per_month_price < ? OR per_month_price = ? OR per_month_price = ?)) AND (rating > ? or rating = ?)', @min_price, @max_price, @min_price, @max_price, @min_price, @max_price, @min_price, @max_price, @min_price, @max_price, @min_price, @max_price, @min_price, @max_price, @min_price, @max_price, @rating, @rating).order('id DESC'),
          advertisements: Advertisement.where(admin_verified: true, id: advertisement_ids)
      }
    end
  end

  def make_categories_results(search_arr)
    category_id_collection = get_category_ids(search_arr)
    category_ids = single_arr(category_id_collection)
    category_ids
  end

  def get_category_ids(search_arr)
    ids = []
    search_arr.each do |search|
      ids << Category.where('name LIKE ?', "%#{search}%").map(&:id)
    end
    ids
  end

  def get_product_ids_by_search(search_arr)
    ids = []
    search_arr.each do |search|
      ids << Product.where(admin_verified: true).where('lower(name) LIKE ? OR lower(description) LIKE ?', "%#{search.downcase}%", "%#{search.downcase}%").map(&:id)
    end
    single_arr(ids).uniq
  end

  def get_service_ids_by_search(search_arr)
    ids = []
    search_arr.each do |search|
      ids << Service.where(admin_verified: true).where('lower(service_description) LIKE ?', "%#{search.downcase}%").map(&:id)
    end
    single_arr(ids).uniq
  end

  def get_advertisement_ids_by_search(search_arr)
    ids = []
    search_arr.each do |search|
      ids << Advertisement.where(admin_verified: true).where('lower(title) LIKE ?', "%#{search.downcase}%").map(&:id)
    end
    single_arr(ids).uniq
  end

  def single_arr(id_collection)
    ids = []
    id_collection.each do |c_ids|
      c_ids.each do |id|
        ids << id
      end
    end
    ids.uniq
  end

  def get_product_id_by_category(category_ids)
    product_ids = Product.where(category_id: category_ids, admin_verified: true).map(&:id)
  end

  def get_service_id_by_category(category_ids)
    service_ids = Service.where(category_id: category_ids, admin_verified: true).map(&:id)
  end

  def get_advertisement_id_by_category(category_ids)
    advertisement_ids = Advertisement.where(admin_verified: true).where(category_id: category_ids).map(&:id)
  end

end