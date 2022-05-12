class Band < ApplicationRecord
    validates :name, presence: true, uniqueness: true

    # for Album:band
    has_many :albums,
        foreign_key: :band_id,
        class_name: :Album,
        primary_key: :id

end
