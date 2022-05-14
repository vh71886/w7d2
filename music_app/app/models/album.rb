class Album < ApplicationRecord
    validates :band_id, :year, :title, :studio, presence: true

    # done
    belongs_to :band,
        foreign_key: :band_id,
        class_name: :Band,
        primary_key: :id

end
