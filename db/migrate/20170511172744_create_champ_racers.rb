class CreateChampRacers < ActiveRecord::Migration
  def change
    create_table :champ_racers do |t|
      t.text :fn, null: false
      t.text :sn, null: false
      t.date :b_date, null: false
      t.text :country, null: false
      t.integer :win_rate, null: false

      t.timestamps null: false
    end
  end
end
