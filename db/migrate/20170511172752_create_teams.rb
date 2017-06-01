class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.text :name, null: false
      t.text :engine_prod, null: false
      t.references :champ_racer, index: true, foreign_key: true
      t.references :champ_racer1, index: true
      t.integer :numbr1
      t.integer :numbr2
      t.text :country, null: false
      t.index [:champ_racer_id, :champ_racer1_id], unique: true
      t.timestamps null: false
 end
  	reversible do |dir|
      dir.up do
        execute("ALTER TABLE teams ADD FOREIGN KEY (champ_racer1_id) REFERENCES champ_racers (id)")
      end
    end
  end
end
