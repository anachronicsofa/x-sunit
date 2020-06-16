class CreateSurvivors < ActiveRecord::Migration[6.0]
  def change
    create_table :survivors do |t|
      t.string :name
      t.date :birthdate
      t.string :gender
      t.float :latitude
      t.float :longitude
      t.integer :reports_received
      t.boolean :abducted

      t.timestamps
    end
  end
end
