class Memory < ActiveRecord::Base
  has_many :categories
  belongs_to :children
  belongs_to :users
end
