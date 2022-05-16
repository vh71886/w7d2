class Album < ApplicationRecord
    validates :band_id, :year, :title, :studio, presence: true
    validates :band_id, uniqueness: { scope: :title }

    # done
    belongs_to :band,
        foreign_key: :band_id,
        class_name: :Band,
        primary_key: :id

    # for Track:album
    has_many :tracks,
        foreign_key: :album_id,
        class_name: :Track,
        primary_key: :id


end
