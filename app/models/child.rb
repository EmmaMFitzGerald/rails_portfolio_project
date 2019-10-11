class Child < ApplicationRecord
  validates :name, presence: :true, length: {minimum: 2, maximum: 15}
  validates :birthday, presence: :true
  has_many :memories
  accepts_nested_attributes_for :memories
  has_many :categories, through: :memories
  belongs_to :user
  validates :user_id, presence: :true
  
end
