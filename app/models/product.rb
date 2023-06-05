class Product < ActiveRecord::Base
  has_many :reviews
  has_many :users, through: :reviews

  def reviews
    Review.where(product_id: id)
  end

  def users
    User.joins(:reviews).where(reviews: { product_id: id })
  end

  def leave_review(user, star_rating, comment)
    Review.create(user_id: user.id, product_id: id, star_rating: star_rating, comment: comment)
  end

  def print_all_reviews
    reviews.each do |review|
      review.print_review
    end
  end

  def average_rating
    total_ratings = reviews.sum(:star_rating)
    total_reviews = reviews.count
    total_reviews > 0 ? total_ratings.to_f / total_reviews : 0.0
  end
end
