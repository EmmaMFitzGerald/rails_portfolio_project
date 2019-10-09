class User < ApplicationRecord
  has_many :children
  has_many :memories

  has_secure_password
end
