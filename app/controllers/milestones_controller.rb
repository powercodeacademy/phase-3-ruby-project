class MilestonesController < ApplicationController
  get "/milestones" do
    Entry.all.to_json
  end

  get "/milestones/:id" do
  end

  post "/milestones" do
  end

  patch "/milestones/:id" do
  end

  delete "/milestones/:id" do
  end
end
