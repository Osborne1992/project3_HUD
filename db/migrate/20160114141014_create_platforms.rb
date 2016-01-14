class CreatePlatforms < ActiveRecord::Migration
  def change
    create_table :platforms do |t|
      t.string :name
      t.string :owner
      t.integer :released

      t.timestamps null: false
    end
  end
end
