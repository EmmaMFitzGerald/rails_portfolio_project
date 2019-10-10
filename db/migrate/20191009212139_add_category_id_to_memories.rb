class AddCategoryIdToMemories < ActiveRecord::Migration[6.0]
  def change
    add_column :memories, :category_id, :integer
  end
end
