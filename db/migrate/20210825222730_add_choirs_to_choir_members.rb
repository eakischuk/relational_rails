class AddChoirsToChoirMembers < ActiveRecord::Migration[5.2]
  def change
    add_reference :choir_members, :choir, foreign_key: true
  end
end
