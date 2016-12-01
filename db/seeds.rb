Post.destroy_all
Author.destroy_all
WordRank.destroy_all

1.times do
  Post.create(
    title: Faker::Hipster.sentence,
    content: Faker::Hipster.paragraph(20),
    author_id: Author.create(name: Faker::Book.author).id
  )
end
