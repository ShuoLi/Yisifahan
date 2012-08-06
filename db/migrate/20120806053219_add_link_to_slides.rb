class AddLinkToSlides < ActiveRecord::Migration
  def change
    add_column :slides, :link, :string
  end
end
