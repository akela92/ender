json.array!(@escenario_ideals) do |escenario_ideal|
  json.extract! escenario_ideal, :id, :nombre, :descripcion, :dificultad, :script_maquinas, :mv_array
  json.url escenario_ideal_url(escenario_ideal, format: :json)
end
