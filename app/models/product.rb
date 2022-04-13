class Product < ActiveRecord::Base
    has_many :reviews
    has_many :users, through: :reviews

    def leave_review(user, star_rating, comment)
        Review.create(star_rating: star_rating, comment: "#{comment}", user_id: user.id, product_id: self.id)
    end

    def print_all_reviews
        self.reviews.each { |review| puts "Review for #{review.product.name} by #{review.user.name}: #{review.star_rating}. #{review.comment}"}
    end

    def average_rating
        count= 0
        totals = 0
        self.reviews.each { |review| 
        count += 1 
        totals += review.star_rating}
        final = totals/count
        final
    end
    
end