json.array!(@assignments) do |assignment|
  json.extract! assignment, :id, :teacher_id, :name, :duedate
  json.url assignment_url(assignment, format: :json)
end
