class AddItemCodesToItems < ActiveRecord::Migration
  def change
    add_column :items, :item_code, :integer
  end
end
