class SearchAlgorithm

  def initialize(search_id)

    # puts '==== Loading search from id'
    @search = Search.find(search_id)

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

  def find_and_load_models(product_ids, service_ids, advertisement_ids)
    @results << {
        products: Product.where(id: product_ids, admin_verified: true).where('end_at > ?', DateTime.now),
        services: Service.where(id: service_ids, admin_verified: true).where('end_at > ?', DateTime.now),
        advertisements: Advertisement.where(admin_verified: true, id: advertisement_ids)
    }
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
      ids << Product.where(admin_verified: true).where('name LIKE ?', "%#{search}%").map(&:id)
    end
    single_arr(ids).uniq
  end

  def get_service_ids_by_search(search_arr)
    ids = []
    search_arr.each do |search|
      ids << Service.where(admin_verified: true).where('service_description LIKE ?', "%#{search}%").map(&:id)
    end
    single_arr(ids).uniq
  end

  def get_advertisement_ids_by_search(search_arr)
    ids = []
    search_arr.each do |search|
      ids << Advertisement.where(admin_verified: true).where('title LIKE ?', "%#{search}%").map(&:id)
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