class CreateSurvivors < ActiveRecord::Migration[6.0]
  def change
    create_table :survivors do |t|
      t.string :name, null: false
      t.date :birthdate, null: false
      t.string :gender, null: false
      t.float :latitude, null: false
      t.float :longitude, null: false
      t.integer :reports_received, default: 0
      t.boolean :abducted, default: false

      t.timestamps
    end
  end
end
