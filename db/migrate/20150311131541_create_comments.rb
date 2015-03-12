class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :user, index: true
      t.text :text
      t.integer :commentable_id, index: true, null: false
      t.string :commentable_type, null: false
      t.boolean :important, default: false, null: false

      t.timestamps null: false
    end
    add_foreign_key :comments, :users
  end
end
