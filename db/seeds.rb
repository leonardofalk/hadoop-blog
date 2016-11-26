# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Create 15 posts

Post.destroy_all
Author.destroy_all

15.times do
  Post.create(
    title: Faker::Hipster.sentence,
    content: Faker::Hipster.paragraph(20),
    author_id: Author.create(name: Faker::Book.author).id
  )
end
