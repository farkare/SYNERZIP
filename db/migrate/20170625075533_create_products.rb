class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.float :price
      t.string :color
      t.integer :status, limit: 1
      t.timestamp :inward_date
      t.string :type
      t.string :description

      t.timestamps null: false
    end
  end
end
