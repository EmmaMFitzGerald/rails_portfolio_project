class User < ApplicationRecord
  has_many :children
  has_many :memories, dependent: :destroy
 
  has_many :children_with_memories, through: :memories, source: :child
  has_secure_password
  validates :password, presence: true, length: { minimum: 5 }, allow_nil: true
  validates :name, presence: true,  length:  { minimum: 2 }
  validates :email, presence: true, format: { with: /\A[^@\s]+@([^@.\s]+\.)+[^@.\s]+\z/ }
end
