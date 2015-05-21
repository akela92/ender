class EscenarioIdeal < ActiveRecord::Base
  #attr_accessible :descripcion, :dificultad, :nombre, :script_maquinas
  has_many :escenarios
  mount_uploader :picture, PictureUploader
end
