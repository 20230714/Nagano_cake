class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|

      t.integer :genre_id
      t.string :name
      t.text :description
      t.integer :price
      t.boolean :is_sold_out, default: "false"

      t.timestamps
    end
  end
end
