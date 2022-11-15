json.extract! notam, :id, :title, :notam_date, :author, :notam_body, :created_at, :updated_at
json.url notam_url(notam, format: :json)
