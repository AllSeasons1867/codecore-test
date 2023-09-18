class User < ApplicationRecord
    has_secure_password

    has_many :likes

    has_many :liked_questions, through: :likes, source: :question

    validates :first_name, :last_name, presence: true 
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

    validates(:email, presence: true, uniqueness: true, format: VALID_EMAIL_REGEX)

    has_many :questions, dependent: :nullify 
    has_many :answers, dependent: :nullify 

    def full_name 
        first_name + " " + last_name
    end
end


