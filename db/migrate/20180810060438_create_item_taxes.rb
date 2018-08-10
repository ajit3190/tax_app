class CreateItemTaxes < ActiveRecord::Migration[5.2]
  def change
    create_table :item_taxes do |t|
    	t.string :name
    	t.references :item
    	t.integer :tax_type
    	t.float :tax

      t.timestamps
    end
  end
end
