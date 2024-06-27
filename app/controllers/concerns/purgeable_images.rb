module PurgeableImages
  extend ActiveSupport::Concern
  include ActionView::RecordIdentifier

  included do
    before_action :set_resource
  end

  def destroy
    image_attribute.purge_later

    respond_to do |format|
      format.html { redirect_to(redirect_path) }
      format.turbo_stream { render turbo_stream: turbo_stream.remove(dom_id(@resource, image_symbol)) }
    end
  end

  private

  def set_resource
    @resource = resource_class.find(params[resource_id_param])
  end

  def image_attribute
    @resource.send(image_symbol)
  end

  def image_symbol
    raise NotImplementedError, "Subclasses must implement the image_symbol method"
  end

  def resource_class
    raise NotImplementedError, "Subclasses must implement the resource_class method"
  end

  def resource_id_param
    raise NotImplementedError, "Subclasses must implement the resource_id_param method"
  end

  def redirect_path
    raise NotImplementedError, "Subclasses must implement the redirect_path method"
  end
end
