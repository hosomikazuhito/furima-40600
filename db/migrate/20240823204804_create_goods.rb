class CreateGoods < ActiveRecord::Migration[7.0]
  def change
    create_table :goods do |t|
      t.string :name, null: false
      t.text :name_explanation, null: false
      t.integer :category_id, null: false
      t.integer :condition_id, null: false
      t.integer :delivery_id, null: false
      t.integer :aria_id, null: false
      t.integer :shipment_id, null: false
      t.integer :price, null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
