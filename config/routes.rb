# config/routes.rb
Rails.application.routes.draw do
  # Define routes for the LocationsController
  resources :locations
end

# This single line of code generates RESTful routes for the LocationsController, which includes routes for creating, reading, updating, and deleting locations. It automatically maps HTTP verbs (GET, POST, PATCH, DELETE) to controller actions based on conventions.

# With this setup, the following routes will be available for the LocationsController:

# GET /locations: Display a list of all locations.
# GET /locations/new: Display a form for creating a new location.
# POST /locations: Create a new location (from the form submission).
# GET /locations/:id: Display details of a specific location.
# GET /locations/:id/edit: Display a form for editing a specific location.
# PATCH/PUT /locations/:id: Update a specific location (from the form submission).
# DELETE /locations/:id: Delete a specific location.

# Rails automatically maps these routes to corresponding actions in the LocationsController, such as index, show, new, create, edit, update, and destroy. You'll need to implement these actions in your controller to handle the corresponding requests.