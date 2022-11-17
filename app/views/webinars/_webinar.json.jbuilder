json.extract! webinar, :id, :title, :host, :webinar_date, :meta_description, :meta_keywords, :created_at, :updated_at
json.url webinar_url(webinar, format: :json)
