class AddClimbingGymsToGymMembers < ActiveRecord::Migration[5.2]
  def change
    add_reference :gym_members, :climbing_gym, foreign_key: true
  end
end
