class CreateChoirMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :choir_members do |t|
      t.string :name
      t.references :choir_id, :choirs, foreign_key: true
      t.integer :age
      t.boolean :active
      t.string :voice_type

      t.timestamps
    end
  end
end
