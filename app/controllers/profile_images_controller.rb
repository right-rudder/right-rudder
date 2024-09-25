class ProfileImagesController < ApplicationController
  include ActionView::RecordIdentifier
  load_and_authorize_resource :user

  def destroy
    current_user.profile_image.purge_later

    respond_to do |format|
      format.html { redirect_to(edit_user_registration_path) }
      format.turbo_stream { render turbo_stream: turbo_stream.remove(dom_id(current_user, :profile_image)) }
    end
  end
end
