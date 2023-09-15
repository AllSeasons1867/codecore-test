class Question < ApplicationRecord
    validates(:title, presence: true)

    validates(:body, presence: {message: "must be given"}, length: {minimum: 10, maximum: 2048})

    validates(:view_count,numericality: {great_than_or_equal_to: 0})

    validate :no_monkey

    before_validation :set_default_view_count, :set_default_like_count

    private 
    def set_default_view_count
        self.view_count ||= 0
    end

    def set_default_like_count
        self.like_count ||= 0
    end

    def no_monkey
        if body&.downcase&.include?("monkey")
            errors.add(:body,"must not have a monkey")
        end
    end
end


