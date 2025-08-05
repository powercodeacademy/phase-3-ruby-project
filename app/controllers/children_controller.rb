class ChildrenController < ApplicationController
  get "/children" do
    Child.all.to_json
  end

  get "/children/:id" do
  end

  post "/children" do
    begin
      parsed_birthdate = Date.parse(params[:birthdate])
    rescue ArgumentError
      status 400
      return { error: "Invalid birthdate format. Use YYYY-MM-DD." }.to_json
    end

    new_child = Child.create(
      name: params[:name],
      birthdate: parsed_birthdate
    )

    new_child.to_json
  end

  patch "/children/:id" do
  end

  delete "/children/:id" do
  end
end
