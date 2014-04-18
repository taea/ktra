class AddTwitterInfoToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :twitter_id, :string
    add_column :tasks, :twitter_meta_data, :text
  end
end
