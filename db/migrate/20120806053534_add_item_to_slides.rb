class AddItemToSlides < ActiveRecord::Migration
  def change
    add_column :slides, :item_id, :integer
  end
end
