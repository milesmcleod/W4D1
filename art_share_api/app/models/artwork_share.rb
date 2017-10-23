class ArtworkShare < ApplicationRecord
  validates :viewer_id, :artwork_id, presence: true
  validates :viewer_id, uniqueness: { scope: :artwork_id, message: "Duplicate Share"}

  belongs_to :viewer,
  foreign_key: :viewer_id,
  primary_key: :id,
  class_name: 'User'

  belongs_to :artwork,
  foreign_key: :artwork_id,
  primary_key: :id,
  class_name: 'Artwork'

end
