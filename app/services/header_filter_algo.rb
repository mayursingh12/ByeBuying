class HeaderFilterAlgo

  def initialize
    @headers = Header.all.where(ready_for_post: true)
  end

  def filter_by_title(title)
    @headers = @headers.where('title LIKE ?', "%#{title}%")
  end

  def filter_by_category(category_name)
    categories = Category.where('name LIKE ?', "%#{category_name}%")
    category_ids = categories.collect {|x| x.id}
    @headers =  @headers.where(category_id: category_ids)
  end

  def filter_by_all(title, category_name)
    categories = Category.where('name LIKE ?', "%#{category_name}%")
    category_ids = categories.collect {|x| x.id}
    @headers =  @headers.where(category_id: category_ids).where('title LIKE ?', "%#{title}%")
  end

end