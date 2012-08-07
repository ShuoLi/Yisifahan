class RemoveLinkFromSlides < ActiveRecord::Migration
  def up
    remove_column :slides, :link
  end

  def down
    add_column :slides, :link, :string
  end
end
