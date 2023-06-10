class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.references :user, null: false, foreign_key: { on_delete: :cascade }
      t.references :likeable, polymorphic: true, foreign_keys: { on_delete: :cascade }

      t.timestamps
    end

    add_index :likes, [:user_id, :likeable_id, :likeable_type], unique: true
  end
end
