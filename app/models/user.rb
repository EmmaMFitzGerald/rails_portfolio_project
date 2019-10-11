class User < ApplicationRecord
  has_many :children
  has_many :memories
 
  has_many :children_with_memories, through: :memories, source: :child
  has_secure_password
  validates :password, presence: true, length: { minimum: 5 } 
end
