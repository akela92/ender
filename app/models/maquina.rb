class Maquina < ActiveRecord::Base
  attr_accessible :nombre, :timestamp

  def new

    @maquinas = Maquina.new
  end
end