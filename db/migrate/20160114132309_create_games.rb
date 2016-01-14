class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :genre
      t.integer :rating
      t.string :publisher
      t.string :developer
      t.datetime :release_date

      t.timestamps null: false
    end
  end
end
