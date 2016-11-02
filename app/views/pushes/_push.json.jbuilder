json.extract! push, :id, :title, :when, :user_id, :doctor_id, :created_at, :updated_at
json.url push_url(push, format: :json)