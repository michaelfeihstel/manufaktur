class CreateDefects < ActiveRecord::Migration
  def change
    create_table :defects do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
