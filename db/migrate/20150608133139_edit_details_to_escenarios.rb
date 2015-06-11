class EditDetailsToEscenarios < ActiveRecord::Migration
  def change
  	rename_column :escenarios, :fichero, :picture
  end
end
