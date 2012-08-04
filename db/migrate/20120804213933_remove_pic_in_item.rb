class RemovePicInItem < ActiveRecord::Migration
  def up
    remove_column :items, :pic
  end

  def down
    add_column :items, :pic, :text
  end
end
