class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
    	t.string :name
    	t.references :item_category
    	t.float :price
    	t.float :actual_price

      t.timestamps
    end
  end
end
