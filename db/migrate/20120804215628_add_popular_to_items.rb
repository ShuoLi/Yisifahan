class AddPopularToItems < ActiveRecord::Migration
  def change
    add_column :items, :popular, :boolean, :default => false
  end
end
