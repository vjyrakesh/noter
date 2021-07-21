class Category < ApplicationRecord
    has_and_belongs_to_many :notes
    validates :name, presence: true

    def to_s
        name
    end
end
