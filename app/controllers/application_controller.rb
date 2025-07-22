# frozen_string_literal: true

class ApplicationController < Sinatra::Base
  set :default_content_type, "application/json"

  # Add your routes here
  get "/" do
    { message: "Good luck with your project!" }.to_json
  end

  # Test route
  get "/test" do
    { message: "Test route working!" }.to_json
  end

  # Owner routes
  get "/owners" do
    owners = Owner.all
    owners.to_json(include: :pets)
  end

  get "/owners/:id" do
    owner = Owner.find(params[:id])
    owner.to_json(include: :pets)
  rescue ActiveRecord::RecordNotFound
    status 404
    { error: "Owner not found" }.to_json
  end

  post "/owners" do
    owner = Owner.new(params)
    if owner.save
      status 201
      owner.to_json(include: :pets)
    else
      status 422
      { errors: owner.errors.full_messages }.to_json
    end
  end

  patch "/owners/:id" do
    owner = Owner.find(params[:id])
    if owner.update(params)
      owner.to_json(include: :pets)
    else
      status 422
      { errors: owner.errors.full_messages }.to_json
    end
  rescue ActiveRecord::RecordNotFound
    status 404
    { error: "Owner not found" }.to_json
  end

  delete "/owners/:id" do
    owner = Owner.find(params[:id])
    owner.destroy
    { message: "Owner deleted successfully" }.to_json
  rescue ActiveRecord::RecordNotFound
    status 404
    { error: "Owner not found" }.to_json
  end

  # Pet routes
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

  # Relationship route
  get "/owners/:owner_id/pets" do
    owner = Owner.find(params[:owner_id])
    owner.pets.to_json(include: :owner)
  rescue ActiveRecord::RecordNotFound
    status 404
    { error: "Owner not found" }.to_json
  end
end
