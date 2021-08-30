class CreateClimbingGyms < ActiveRecord::Migration[5.2]
  def change
    create_table :climbing_gyms do |t|
      t.string :name
      t.boolean :ropes
      t.integer :total_routes
      
      t.timestamps
    end
  end
end
