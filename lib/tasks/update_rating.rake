namespace :ratings do

  task update: :environment do

    Product.find_each do |product|

      ratings = product.ratings

      avg = ratings.map(&:number).inject(:+)

      product.update_attribute(rating: avg)

    end

    Service.find_each do |product|

      ratings = product.ratings

      avg = ratings.map(&:number).inject(:+)

      product.update_attribute(rating: avg)

    end

  end

end