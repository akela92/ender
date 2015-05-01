json.array!(@maquinas) do |maquina|
  json.extract! maquina, :id, :nombre, :id_escenario
  json.url maquina_url(maquina, format: :json)
end
