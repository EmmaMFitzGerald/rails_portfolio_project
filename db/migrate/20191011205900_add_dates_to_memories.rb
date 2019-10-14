class AddDatesToMemories < ActiveRecord::Migration[6.0]
  def change
    add_column :memories, :date, :date
  end
end
