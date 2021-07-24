class Note < ApplicationRecord
    has_and_belongs_to_many :categories
    validates :content, presence: true

    def self.search(query)
        if query
            Note.where("content LIKE '%#{query}%'")
        else
            Note.all
        end
    end
end
