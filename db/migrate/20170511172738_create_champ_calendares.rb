class CreateChampCalendares < ActiveRecord::Migration
  def change
    create_table :champ_calendares do |t|
      t.text :champ_name, null: false
      t.integer :numb, null: false
      t.date :start_date, null: false
      t.text :country, null: false
      t.text :place, null: false

      t.timestamps null: false
    end
  end
end
