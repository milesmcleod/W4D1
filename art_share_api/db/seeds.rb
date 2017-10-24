# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user1 = User.new(username: 'boring')
user2 = User.new(username: 'sad')
user3 = User.new(username: 'paints_birds')
user4 = User.new(username: 'paints_frogs')
user1.save
user2.save
user3.save
user4.save

artwork1 = Artwork.new(title: 'birds', image_url: 'birds.com', artist_id: 3)
artwork2 = Artwork.new(title: 'frogs', image_url: 'frogs.com', artist_id: 4)
artwork1.save
artwork2.save

share1 = ArtworkShare.new(artwork_id: 1, viewer_id: 1)
share1.save

comment1 = Comment.new(author_id: 1, artwork_id: 1, body: "adf")
comment1.save
