module NewsletterEmailsHelper

  def create_json_credentials(path)

    ## Testing
    puts "TYPE: #{ENV['TYPE']}"
    puts "PROJECT_ID: #{ENV['PROJECT_ID']}"
    puts "PRIVATE_KEY_ID: #{ENV['PRIVATE_KEY_ID']}"
    puts "PRIVATE_KEY: #{ENV['PRIVATE_KEY']}"
    puts "CLIENT_EMAIL: #{ENV['CLIENT_EMAIL']}"
    puts "CLIENT_ID: #{ENV['CLIENT_ID']}"
    puts "AUTH_URI: #{ENV['AUTH_URI']}"
    puts "TOKEN_URI: #{ENV['TOKEN_URI']}"
    puts "AUTH_PROVIDER_X509_CERT_URL: #{ENV['AUTH_PROVIDER_X509_CERT_URL']}"
    puts "CLIENT_X509_CERT_URL: #{ENV['CLIENT_X509_CERT_URL']}"




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

  def delete_json_credentials(path)
    File.open(path, 'w') do |f|
      f.write(" ")
    end
  end
  
end
