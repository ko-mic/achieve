class Inquiry < ActiveRecord::Base
    validates :name, presence: true, length: { maximum: 50 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }#, uniqueness: { case_sensitive: false }
    validates :phone, presence: true, length: { in: 10..13 }
end
