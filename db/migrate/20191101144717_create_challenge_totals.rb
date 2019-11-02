class CreateChallengeTotals < ActiveRecord::Migration[6.0]
  def change
    create_table :challenge_totals do |t|
      t.integer :points
      t.references :athlete
      t.timestamps
    end
  end
end
