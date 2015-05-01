class CreateEscenarioIdeals < ActiveRecord::Migration
  def change
    create_table :escenario_ideals do |t|
      t.string :nombre
      t.text :descipcion
      t.integer :dificultad
      t.text :script_maquinas
      t.string :mv_array

      t.timestamps null: false
    end
  end
end
