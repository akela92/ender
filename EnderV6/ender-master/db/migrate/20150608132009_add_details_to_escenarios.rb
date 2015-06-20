class AddDetailsToEscenarios < ActiveRecord::Migration
  def change
    add_column :escenarios, :estado, :string
    add_column :escenarios, :fichero, :string
  end
end
