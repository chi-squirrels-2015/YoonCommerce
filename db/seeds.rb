require 'faker'

10.times {Category.create!(name:Faker::Commerce.department) }

array_of_cat_id = []

all_category = Category.all
all_category.each {|category| array_of_cat_id << category.id }

10.times {Product.create!(price: Faker::Commerce.price, name: Faker::Commerce.product_name, category_id: array_of_cat_id.sample, image: Faker::Avatar.image) }

10.times {User.create!(username: Faker::Name.name, email: Faker::Internet.email, password: "asdf") }

users = User.all

# 10.times{ Product.all.each {|product| LineItem.create!(user_id: users.sample.id, product: product)} }
