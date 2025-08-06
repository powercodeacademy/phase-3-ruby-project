class PetsController < ApplicationController
  get "/pets" do
    pets = Pet.all
    pets.to_json(include: :owner)
  end

  get "/pets/:id" do
    pet = Pet.find(params[:id])
    pet.to_json(include: :owner)
  rescue ActiveRecord::RecordNotFound
    status 404
    { error: "Pet not found" }.to_json
  end

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

  delete "/pets/:id" do
    pet = Pet.find(params[:id])
    pet.destroy
    { message: "Pet deleted successfully" }.to_json
  rescue ActiveRecord::RecordNotFound
    status 404
    { error: "Pet not found" }.to_json
  end
end
