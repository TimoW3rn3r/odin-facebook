class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.string :body, null: false
      t.references :user, null: false, foreign_key: { on_delete: :cascade }
      t.references :commentable, polymorphic: true, foreign_keys: { on_delete: :cascade }

      t.timestamps
    end
  end
end
