class RemoveItemIdFromItems < ActiveRecord::Migration
  def up
    remove_column :items, :item
  end

  def down
    add_column :items, :item, :id
  end
end
