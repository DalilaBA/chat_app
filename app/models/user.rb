class User < ApplicationRecord
  validates :username, presence: true, uniqueness: {case_sensitive: false} ,length: {minimum: 3, maxmimum: 15}
  has_secure_password
  has_many :messages, dependent: :destroy
end
