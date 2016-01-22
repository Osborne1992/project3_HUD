class MakeCommentsPolymorphic < ActiveRecord::Migration
  def change
    remove_column :comments, "event_id", :integer
    remove_column :comments, "group_id", :integer
    remove_column :comments, "review_id", :integer
    remove_column :comments, "tournament_id", :integer
    remove_column :comments, "user_id", :integer
    add_column :comments, :commentable_id, :integer
    add_column :comments, :commentable_type, :string

  end
end
