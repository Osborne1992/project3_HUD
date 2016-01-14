class CreateEventTournaments < ActiveRecord::Migration
  def change
    create_table :event_tournaments do |t|
      t.references :event, index: true, foreign_key: true
      t.references :tournament, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
