class Note < ApplicationRecord
    has_and_belongs_to_many :categories
    validates :content, presence: true
    belongs_to :user

    def self.search(query, user_id)
        if query
            User.find_by(id: user_id).notes.where("content LIKE '%#{query}%'")
        else
            User.find_by(id: user_id).notes
        end
    end
end
