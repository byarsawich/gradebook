json.array!(@grades) do |grade|
  json.extract! grade, :id, :student_id, :assignment_id, :grade
  json.url grade_url(grade, format: :json)
end
