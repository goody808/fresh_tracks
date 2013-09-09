class LocationsController < ApplicationController
  
  def new
    @location = Location.new
  end

  def create
    @location = Location.new(params[:location])
    @location.update_coordinates

    if @location.save
      redirect_to @location
    else 
      render action: "new" 
    end 
  end

  def edit
    @location = Location.find(params[:id])
  end 
  
  def update
    @location = Location.find(params[:id])
    @location.update_attributes!(params[:location])
    @location.update_coordinates

    if @location.save
      redirect_to @location
    else
      render 'edit'
    end   
  end

  def destroy
  end

  def index
    @locations = Location.all
  end

  def show
    @location = Location.find(params[:id])

  end
end
