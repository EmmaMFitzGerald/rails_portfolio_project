class CreateMemories < ActiveRecord::Migration[6.0]
  def change
    create_table :memories do |t|
      t.string :title
      t.text :content
      t.integer :user_id
      t.integer :child_id
      t.timestamps
    end
  end
end
