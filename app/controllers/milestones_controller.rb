class MilestonesController < ApplicationController
  get "/milestones" do
    Milestone.all.to_json
  end

  get "/milestones/:id" do
    milestone = Milestone.find_by(id: params[:id])
    if milestone
      milestone.to_json
    else
      status 404
      { error: "Milestone not found" }.to_json
    end
  end

  post "/milestones" do
    new_milestone = Milestone.create(
      title: params[:title],
      milestone_type: params[:milestone_type]
    )

    new_milestone.to_json
  end

  patch "/milestones/:id" do
    milestone = Milestone.find_by(id: params[:id])

    if milestone.nil?
      status 404
      return { error: "Milestone not found" }.to_json
    end

    milestone.update(
      title: params[:title],
      milestone_type: params[:milestone_type]
    )

    milestone.to_json
  end

  delete "/milestones/:id" do
    milestone = Milestone.find_by(id: params[:id])

    if milestone.nil?
      status 404
      return { error: "Milestone not found" }.to_json
    end

    milestone.destroy

    milestone.to_json
  end

  get "/milestones/:milestone_id/entries" do
    milestone = Milestone.find_by(id: params[:milestone_id])

    if milestone.nil?
      status 404
      return { error: "Milestone not found" }.to_json
    end

    milestone.entries.to_json(include: :milestone)
  end

  post "/milestones/:milestone_id/entries" do
    milestone = Milestone.find_by(id: params[:milestone_id])
    if milestone.nil?
      status 404
      return { error: "Milestone not found" }.to_json
    end

    child = Child.find_by(id: params[:child_id])
    if child.nil?
      status 404
      return { error: "Child not found" }.to_json
    end

    entry = Entry.create(
      child_id: child.id,
      milestone_id: milestone.id,
      note: params[:note],
      date: Date.parse(params[:date]),
      age_months: params[:age_months]
    )

    entry.to_json(include: %i[child milestone])
  end
end
