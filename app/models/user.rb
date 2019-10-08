class User < ApplicationRecord
  has_many :children
  has_many :memories
  has_many :categories, through: :memories
end
