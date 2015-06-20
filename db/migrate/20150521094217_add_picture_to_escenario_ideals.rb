class AddPictureToEscenarioIdeals < ActiveRecord::Migration
  def change
    add_column :escenario_ideals, :picture, :string
  end
end
