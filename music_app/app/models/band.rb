class Band < ApplicationRecord
    validates :name, presence: true, uniqueness: true

    # for Album:band
    has_many :albums,
        foreign_key: :band_id,
        class_name: :Album,
        primary_key: :id

    # for Track:band
    has_many :band_tracks,
        through: :albums,
        source: :tracks
end
