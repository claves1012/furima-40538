class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.integer     :category_id      , null: false
      t.integer     :item_status_id   , null: false
      t.integer     :shipping_cost_id , null: false
      t.integer     :pretecture_id    , null: false
      t.integer     :shipping_date_id , null: false
      t.timestamps
    end
  end
end
