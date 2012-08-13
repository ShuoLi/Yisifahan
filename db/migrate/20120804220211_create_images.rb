class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.integer :item_id
      t.string :image

      t.timestamps
    end
    add_index :images, :item_id
  end
end
