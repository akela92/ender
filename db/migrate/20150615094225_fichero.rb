class Fichero < ActiveRecord::Migration
  def change
  	rename_column :escenarios, :picture, :fichero
  end
end
