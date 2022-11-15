#https://medium.com/@kristina.kabosiene/manual-upload-rails-6-active-storage-tinymce-5-and-aws-s3-2f139c0b5df4
#used create_and_upload instead of create_after_upload... had to look at ruby docs..
#https://api.rubyonrails.org/classes/ActiveStorage/Blob.html

class UploaderController < ApplicationController
  skip_forgery_protection
  def image
    blob = ActiveStorage::Blob.create_and_upload!(
      io: params[:file],
      filename: params[:file].original_filename,
      content_type: params[:file].content_type
    )
    
     render json: {location: url_for(blob)}, content_type:  "text / html"
  end
end