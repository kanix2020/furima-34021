class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|

      t.integer :category_id,         null: false
      t.integer :item_state_id,       null: false
      t.integer :delivery_price_id,   null: false
      t.integer :prefecture_id,       null: false
      t.integer :delivery_day_id,     null: false
      t.timestamps
      
    end
  end
end
