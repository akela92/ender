class CambiarDescripcionEscenarios < ActiveRecord::Migration
  def change
  	add_column :escenario_ideals, :descripcion, :string
  	remove_column :escenario_ideals, :descipcion
  end
end
