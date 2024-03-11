class LocationsController < ApplicationController
  # set_location method should be called before any of the actions listed in the only option
  before_action :set_location, only: %i[ show edit update destroy ] 

  # GET /locations or /locations.json
  def index
    @locations = Location.all
  end

  # GET /locations/1 or /locations/1.json
  def show
    @location = Location.find(params[:id])
  end

  # GET /locations/new
  def new
    @location = Location.new
  end

  # GET /locations/1/edit
  def edit
    # Fetch the location to be edited based on its ID
    # This will be handled by the before_action set_location
    @location = Location.find(params[:id])
  end

  # POST /locations or /locations.json
  # handle the form submission for creating a new location
  def create
    # use data received from the form to create a new Location object
    @location = Location.new(location_params)
    if @location.valid? # trigger validations on the @location object
      # respond to different formats
      respond_to do |format|
        # save location to db
        if @location.save
          # redirect to show page for the newly created location & provide success notice
          format.html { redirect_to location_url(@location), notice: "Location was successfully created." }
          format.json { render :show, status: :created, location: @location }
        # if there are validation errors during the save operation
        else
          # new view again with the status :unprocessable_entity (HTTP status code 422)
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @location.errors, status: :unprocessable_entity }
        end
      end
    else
      # Handle validation errors

    end
  end

  # PATCH/PUT /locations/1 or /locations/1.json
  # Update the attributes of the location with the new values provided by the user
  def update
    # specify different responses based on the format of the request (HTML or JSON)
    respond_to do |format|
      # attempt to update the location record with the new values provided by the user
      if @location.update(location_params)
        # if the update was successful and the request was in HTML format, the user is redirected to the location's show page with a success notice
        format.html { redirect_to location_url(@location), notice: "Location was successfully updated." }
        # if the request was in JSON format, the updated location details are rendered in the response body along with a success status
        format.json { render :show, status: :ok, location: @location }
      # if the update was unsuccessful
      else
        # if the request was in HTML format and the update failed, the edit form is re-rendered with the errors highlighted
        format.html { render :edit, status: :unprocessable_entity }
        # if the request was in JSON format and the update failed, the errors are rendered in JSON format along with an appropriate status code
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /locations/1 or /locations/1.json
  # find the location by its ID and delete it from the database
  def destroy
    # retrieve the location to be deleted from the database based on the ID
    @location = Location.find(params[:id])
    # delete the location from the database
    @location.destroy

    # respond differently based on the format of the request
    respond_to do |format|
      format.html { redirect_to locations_url, notice: "Location was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_location
    @location = Location.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def location_params
    params.require(:location).permit(:ip_address, :text_address)
  end
end
