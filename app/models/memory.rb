class Memory < ApplicationRecord
  belongs_to :child
  belongs_to :user
  belongs_to :category
  
  accepts_nested_attributes_for :category

  def category_attributes(category_hash)
    
  end

end
