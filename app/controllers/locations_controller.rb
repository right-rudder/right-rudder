class LocationsController < ApplicationController
  def states
    
    country = params[:country]
    
    states = CS.states(country).map do |key, value|
      { code: key, name: value }
    end
    
    render json: states
  end

  def cities
    
    country = params[:country]
    state = params[:state]
    
    cities = CS.cities(state, country).map do |city|
      { name: city }
    end
    
    render json: cities
  end
end
