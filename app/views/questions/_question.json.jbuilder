json.extract! question, :id, :content, :references, :created_at, :updated_at
json.url question_url(question, format: :json)
