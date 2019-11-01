class CreateAthletes < ActiveRecord::Migration[6.0]
  def change
    create_table :athletes do |t|
      t.string :name
      t.string :myzone_usr_guid
      t.timestamps
    end
  end
end
