class PetsController < ApplicationController
  # GET /pets
  get "/pets" do
    pets = Pet.all
    pets.to_json(include: :owner)
  end

  # GET /pets/:id
  get "/pets/:id" do
    pet = Pet.find(params[:id])
    pet.to_json(include: :owner)
  rescue ActiveRecord::RecordNotFound
    status 404
    { error: "Pet not found" }.to_json
  end

  # POST /pets
  post "/pets" do
    pet = Pet.new(params)
    if pet.save
      status 201
      pet.to_json(include: :owner)
    else
      status 422
      { errors: pet.errors.full_messages }.to_json
    end
  end

  # PATCH /pets/:id
  patch "/pets/:id" do
    pet = Pet.find(params[:id])
    if pet.update(params)
      pet.to_json(include: :owner)
    else
      status 422
      { errors: pet.errors.full_messages }.to_json
    end
  rescue ActiveRecord::RecordNotFound
    status 404
    { error: "Pet not found" }.to_json
  end

  # DELETE /pets/:id
  delete "/pets/:id" do
    pet = Pet.find(params[:id])
    pet.destroy
    { message: "Pet deleted successfully" }.to_json
  rescue ActiveRecord::RecordNotFound
    status 404
    { error: "Pet not found" }.to_json
  end

  # GET /owners/:owner_id/pets
  get "/owners/:owner_id/pets" do
    owner = Owner.find(params[:owner_id])
    owner.pets.to_json(include: :owner)
  rescue ActiveRecord::RecordNotFound
    status 404
    { error: "Owner not found" }.to_json
  end
end
