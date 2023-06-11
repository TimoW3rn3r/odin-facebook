class CreateFriendships < ActiveRecord::Migration[7.0]
  def change
    create_table :friendships do |t|
      t.references :initiator, null: false, foreign_key: { to_table: :users, on_delete: :cascade }
      t.references :target, null: false, foreign_key: { to_table: :users, on_delete: :cascade }
      t.boolean :accepted, default: false

      t.timestamps
    end
  end
end
