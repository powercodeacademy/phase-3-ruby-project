class OwnersController < ApplicationController
  # GET /owners
  get "/owners" do
    owners = Owner.all
    owners.to_json(include: :pets)
  end

  # GET /owners/:id
  get "/owners/:id" do
    owner = Owner.find(params[:id])
    owner.to_json(include: :pets)
  rescue ActiveRecord::RecordNotFound
    status 404
    { error: "Owner not found" }.to_json
  end

  # POST /owners
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

  # PATCH /owners/:id
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

  # DELETE /owners/:id
  delete "/owners/:id" do
    owner = Owner.find(params[:id])
    owner.destroy
    { message: "Owner deleted successfully" }.to_json
  rescue ActiveRecord::RecordNotFound
    status 404
    { error: "Owner not found" }.to_json
  end
end
