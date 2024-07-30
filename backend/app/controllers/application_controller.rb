# frozen_string_literal: true

class ApplicationController < Sinatra::Base
  set :default_content_type, "application/json"

  get "/tools" do
    sort_by = params[:sort_by] || "name"
    tools =
      if sort_by == "available"
        Tool.where(availability: true)
      elsif sort_by == "category"
        Tool.order(:category)
      else
        Tool.order(:name)
      end
    tools.to_json
  end

  get "/tools/:id" do
    tool = Tool.find(params[:id])
    tool.to_json
  end

  post "/tools" do
    tool = Tool.create(
      name: params[:name],
      description: params[:description],
      price_per_day: params[:price_per_day],
      category: params[:category],
      image: params[:image]
    )
    tool.to_json
  end

  # customer controllers
  get "/customers" do
    customers = Customer.all
    customers.to_json(include: :rentals)
  end

  get "/customers/:id" do
    customers = Customer.find(params[:id])
    customers.to_json
  end

  post "/customers" do
    customer = Customer.create(
      first_name: params[:first_name],
      last_name: params[:last_name],
      age: params[:age],
      phone_number: params[:phone_number],
      email_address: params[:email_address],
      current_amount_owed: params[:current_amount_owed]
    )
    customer.to_json
  end

  patch "/customers/:id" do
    customer = Customer.find(params[:id])
    customer.update(
      first_name: params[:first_name],
      last_name: params[:last_name],
      age: params[:age],
      phone_number: params[:phone_number],
      email_address: params[:email_address],
      current_amount_owed: params[:current_amount_owed]
    )
    customer.to_json
  end

  delete "/customers/:id" do
    customer = Customer.find(params[:id])
    customer.destroy
    customer.to_json
  end

  # renteral controllers

  get "/rentals" do
    rentals = Rental.all
    rentals.to_json
  end

  get "/rentals/:id" do
    rental = Rental.find(params[:id])
    rental.to_json
  end

  post "/rentals/new" do
    rental = Rental.create(
      customer_id: params[:customer_id],
      tool_id: params[:tool_id],
      date_out: params[:date_out],
      date_in: params[:date_in]
    )
    rental.to_json
  end

  patch "/rentals/:id" do
    rental = Rental.find(params[:id])
    rental.update(
      customer_id: parmas[:customer_id],
      tool_id: params[:tool_id],
      date_out: params[:date_out],
      date_in: params[:date_in]
    )

    # customer = rental.customer
    # customer.update(current_amount_owed: customer.amount_owed) if rental.date_in

    # rental.to_json(include: :customer)
  end

  delete "/rentals/:id" do
    rental = Rental.find(params[:id])
    rental.destroy
    rental.to_json
  end
end
