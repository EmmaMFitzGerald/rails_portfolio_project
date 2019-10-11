class Child < ApplicationRecord
  has_many :memories
  accepts_nested_attributes_for :memories
  has_many :categories, through: :memories
  belongs_to :user
  
end
