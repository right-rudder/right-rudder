json.extract! newsletter_email, :id, :name, :email, :created_at, :updated_at
json.url newsletter_email_url(newsletter_email, format: :json)
