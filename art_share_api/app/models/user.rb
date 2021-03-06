class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true

    has_many :artworks,
    foreign_key: :artist_id,
    primary_key: :id,
    class_name: 'Artwork'

    has_many :artwork_shares,
    foreign_key: :viewer_id,
    primary_key: :id,
    class_name: 'ArtworkShare'

    has_many :shared_artworks,
    through: :artwork_shares,
    source: :artwork

    has_many :comments,
    foreign_key: :author_id,
    primary_key: :id,
    class_name: 'Comment',
    dependent: :destroy

    has_many :likes,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: 'Like'

    has_many :liked_comments,
    through: :likes,
    source: :likeable,
    source_type: 'Comment'

    has_many :liked_artworks,
    through: :likes,
    source: :likeable,
    source_type: 'Artwork'

end
