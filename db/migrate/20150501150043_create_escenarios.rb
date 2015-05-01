class CreateEscenarios < ActiveRecord::Migration
  def change
    create_table :escenarios do |t|
      t.integer :id_escenario_ideal
      t.integer :id_user

      t.timestamps null: false
    end
  end
end
