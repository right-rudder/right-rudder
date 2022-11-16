class FeaturedNotamsController < ApplicationController
  def select
    @notams = Notam.all
  end
end
