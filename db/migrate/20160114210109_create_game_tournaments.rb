class CreateGameTournaments < ActiveRecord::Migration
  def change
    create_table :game_tournaments do |t|
      t.references :game, index: true, foreign_key: true
      t.references :tournament, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
