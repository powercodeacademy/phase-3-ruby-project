class OwnersController < ApplicationController
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

  get "/owners/:owner_id/pets" do
    owner = Owner.find(params[:owner_id])
    owner.pets.to_json(include: :owner)
  rescue ActiveRecord::RecordNotFound
    status 404
    { error: "Owner not found" }.to_json
  end
end
