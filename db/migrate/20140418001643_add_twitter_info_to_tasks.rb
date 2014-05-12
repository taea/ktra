class AddTwitterInfoToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :tweet_id, :string
    add_column :tasks, :tweet_meta_data, :text
  end
end
