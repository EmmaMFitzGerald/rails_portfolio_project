class Child < ApplicationRecord
  has_many :memories, dependent :destroy
  accepts_nested_attributes_for :memories
  has_many :categories, through: :memories
  belongs_to :user
  
end
