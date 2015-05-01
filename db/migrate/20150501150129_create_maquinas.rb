class CreateMaquinas < ActiveRecord::Migration
  def change
    create_table :maquinas do |t|
      t.string :nombre
      t.integer :id_escenario

      t.timestamps null: false
    end
  end
end
