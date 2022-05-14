class Track < ApplicationRecord
    validates :album_id, :title, :ord, :bonus, presence: true
    validates :album_id, uniqueness: { scope: :title }

    # done
    belongs_to :album,
        foreign_key: :album_id,
        class_name: :Album,
        primary_key: :id

    # ? done - Track:band
    has_one :band,
        through: :album,
        source: :band
end
