class Child < ApplicationRecord
  has_many :memories
  has_many :categories, through: :memories
  belongs_to :users
end
