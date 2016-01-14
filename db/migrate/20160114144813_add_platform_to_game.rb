class AddPlatformToGame < ActiveRecord::Migration
  def change
    add_reference :games, :platform, index: true, foreign_key: true
  end
end
