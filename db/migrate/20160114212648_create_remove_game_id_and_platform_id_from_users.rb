class CreateRemoveGameIdAndPlatformIdFromUsers < ActiveRecord::Migration
  def change
    create_table :remove_game_id_and_platform_id_from_users do |t|
      t.integer :game_id
      t.integer :platform_id

      t.timestamps null: false
    end
  end
end
