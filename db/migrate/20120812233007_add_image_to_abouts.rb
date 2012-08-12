class AddImageToAbouts < ActiveRecord::Migration
  def change
    add_column :abouts, :image, :string
  end
end
