class Child < ApplicationRecord
  has_many :memories
  accepts_nested_attributes_for :memories
  belongs_to :user
end
