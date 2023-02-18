module NewsletterEmailsHelper

  def create_json_credentials(path)

    credentials = {
      "type": ENV['TYPE'],
      "project_id": ENV['PROJECT_ID'],
      "private_key_id": ENV['PRIVATE_KEY_ID'],
      "private_key": ENV['PRIVATE_KEY'],
      "client_email": ENV['CLIENT_EMAIL'],
      "client_id": ENV['CLIENT_ID'],
      "auth_uri": ENV['AUTH_URI'],
      "token_uri": ENV['TOKEN_URI'],
      "auth_provider_x509_cert_url": ENV['AUTH_PROVIDER_X509_CERT_URL'],
      "client_x509_cert_url": ENV['CLIENT_X509_CERT_URL']
    }
  
    File.open(path, 'w') do |f|
      f.write(credentials.to_json)
    end
  
    path
  end

  def delete_file(path)
    File.open(path, 'w') do |f|
      f.write(" ")
    end
  end
  
end
