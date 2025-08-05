class ChildrenController < ApplicationController
  get "/children" do
    Child.all.to_json
  end

  get "/children/:id" do
  end

  post "/children" do
  end

  patch "/children/:id" do
  end

  delete "/children/:id" do
  end
end
