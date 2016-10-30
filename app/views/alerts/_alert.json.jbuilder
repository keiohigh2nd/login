json.extract! alert, :id, :title, :context, :when, :user_id, :created_at, :updated_at
json.url alert_url(alert, format: :json)