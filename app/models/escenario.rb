class Escenario < ActiveRecord::Base
  attr_accessible :id_escenario_ideal
  has_one :escenario_ideal
  has_many :maquina
  belongs_to :user
end
