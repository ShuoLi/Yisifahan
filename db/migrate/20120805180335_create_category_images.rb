class CreateCategoryImages < ActiveRecord::Migration
  def change
    create_table :category_images do |t|
      t.integer :category_id
      t.string :image

      t.timestamps
    end
  end
end
