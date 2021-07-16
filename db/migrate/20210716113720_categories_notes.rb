class CategoriesNotes < ActiveRecord::Migration[6.1]
  def change
    create_table :categories_notes, id: false do |t|
      t.bigint :category_id
      t.bigint :note_id
    end

    add_index :categories_notes, :category_id
    add_index :categories_notes, :note_id
  end
end
