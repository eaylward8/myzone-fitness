class CreateWorkouts < ActiveRecord::Migration[6.0]
  def change
    create_table :workouts do |t|
      t.integer :points
      t.references :athlete
      t.timestamps
    end
  end
end
