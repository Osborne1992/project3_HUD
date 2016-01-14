class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
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

      t.timestamps null: false
    end
  end
end
