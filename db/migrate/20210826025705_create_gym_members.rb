class CreateGymMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :gym_members do |t|
      t.string :first_name
      t.string :last_name
      t.boolean :belay_status
      t.integer :monthly_checkins
      
      t.timestamps
    end
  end
end
