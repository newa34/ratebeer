class PlacesController < ApplicationController
  def index
  end

  def search
    byebug
    @places = BeermappingApi.places_in(params[:city])
    if @places.nil? or @places.empty?
      redirect_to places_path, notice: "No locations in #{params[:city]}"
    else
      session[:last_search] = params[:city]    
      render :index
    end
  end

  def show
    @place = BeermappingApi.place(params[:id], session[:last_search])

  end

end
