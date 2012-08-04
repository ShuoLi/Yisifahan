class CreatePopularProducts < ActiveRecord::Migration
  def change
    create_table :popular_products do |t|

      t.timestamps
    end
  end
end
