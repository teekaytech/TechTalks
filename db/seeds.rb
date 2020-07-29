# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Vote.destroy_all
ArticleCategory.destroy_all
Article.destroy_all
Category.destroy_all
User.destroy_all

categories = %i[
  Communication
  Construction
  Manufacturing
  Transportation
  Energy/Power
  Bio-Related
]
5.times do |index|
  Category.create(name: categories[index], priority: index)
end
