class RemoveItemidsFromItems < ActiveRecord::Migration
  def up
    remove_column :items, :item_id
  end

  def down
    add_column :items, :item_id, :integer
  end
end
