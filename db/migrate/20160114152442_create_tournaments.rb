class CreateTournaments < ActiveRecord::Migration
  def change
    create_table :tournaments do |t|
      t.string :name
      t.string :host
      t.integer :creator_id
      t.datetime :start_date
      t.datetime :start_time
      t.datetime :end_date
      t.datetime :end_time
      t.text :description
      t.boolean :private
      t.string :location
      t.references :game, index: true, foreign_key: true
      t.references :platform, index: true, foreign_key: true
      t.string :first_prize
      t.string :second_prize
      t.string :third_prize

      t.timestamps null: false
    end
  end
end
