class CreateChoirs < ActiveRecord::Migration[5.2]
  def change
    create_table :choirs do |t|
      t.string :name
      t.integer :openings
      t.boolean :active

      t.timestamps
    end
  end
end
