class Category < ApplicationRecord
    has_and_belongs_to_many :notes

    def to_s
        name
    end
end
