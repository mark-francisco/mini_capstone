# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Product.destroy_all

new_seeded_product = Product.create({:name => "sneakers", :price => 80, :image_url => "sneaker_image_1", :description => "white leather sneakers with minimal design."})

new_seeded_product = Product.create({:name => "socks", :price => 12, :image_url => "socks_image", :description => "cozy wool socks with shapes pattern"})

new_seeded_product = Product.create({:name => "cookies", :price => 12, :image_url => "socks_image", :description => "cozy wool socks with shapes pattern"})

new_seeded_product = Product.create({:name => "anorak", :price => 12, :image_url => "socks_image", :description => "cozy wool socks with shapes pattern"})

new_seeded_product = Product.create({:name => "lambswool sweater", :price => 12, :image_url => "socks_image", :description => "cozy wool socks with shapes pattern"})
