class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.integer :point
      t.string :status
      t.text :memo
      t.datetime :started_at
      t.datetime :finished_at

      t.timestamps
    end
  end
end
