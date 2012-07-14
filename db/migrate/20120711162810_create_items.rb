class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.text :description
      t.text :pic
      t.decimal :price

      t.timestamps
    end
  end
end
