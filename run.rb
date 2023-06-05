require 'active_record'

require_relative 'app/models/user'     #Require models
require_relative 'app/models/product'
require_relative 'app/models/review'

#Create the class instances
user = User.create(name: "Maweu")
product = Product.create(name: "dell laptop")
user.reviews.create(product: product, star_rating: 4, comment: "Great product!")

puts user.reviews.inspect
puts product.reviews.inspect
puts user.products.inspect
puts product.users.inspect

product.leave_review(user, 4, "Great Laptop")
product.print_all_reviews
puts product.average_rating

puts user.favorite_product.inspect
product2 = Product.create(name: "iphone 14")
product2.leave_review(user, 4.5, "Great phone with great features")
puts user.favorite_product.inspect

user.remove_reviews(product)
puts user.reviews.inspect
