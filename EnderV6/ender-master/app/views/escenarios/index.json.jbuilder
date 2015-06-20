json.array!(@escenarios) do |escenario|
  json.extract! escenario, :id, :id_escenario_ideal, :id_user
  json.url escenario_url(escenario, format: :json)
end
