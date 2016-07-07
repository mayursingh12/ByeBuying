class AdvertisementFilterAlgo

  def initialize
    @advertisements = Advertisement.all.where(ready_for_post: true)
  end

  def filter_by_title(title)
    @advertisements = @advertisements.where('title LIKE ?', "%#{title}%")
  end

  def filter_by_category(category_name)
    categories = Category.where('name LIKE ?', "%#{category_name}%")
    category_ids = categories.collect {|x| x.id}
    @advertisements =  @advertisements.where(category_id: category_ids)
  end

  def filter_by_all(title, category_name)
    categories = Category.where('name LIKE ?', "%#{category_name}%")
    category_ids = categories.collect {|x| x.id}
    @advertisements =  @advertisements.where(category_id: category_ids).where('title LIKE ?', "%#{title}%")
  end

end