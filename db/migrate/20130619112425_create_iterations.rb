class CreateIterations < ActiveRecord::Migration
  def change
    create_table :iterations do |t|
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
