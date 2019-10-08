class Category < ActiveRecord::Base
  has_many :memories
  belongs_to :children, through: :memories
end
