# class PasswordValidator < ActiveModel::Validator
#   def validate(record)
#     debugger
#     if record.password != record.password_confirm
#       record.errors.add "Passwords do not match"
#     end
#   end
# end

class User < ApplicationRecord
  before_save { self.email = email.downcase }
  has_many :articles, dependent: :destroy
  validates :username, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 3, maximum: 25 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 105 }, format: { with: VALID_EMAIL_REGEX }
  # validates_with PasswordValidator
  has_secure_password
end
