import React from "react"
import "bootstrap/dist/css/bootstrap.min.css"

function StatCard({ bnb }) {
  const {
    name,
    location,
    total_revenue,
    num_of_rooms,
    cost_per_night,
    avg_guest_age,
    bnb_activity,
    revenue_forcasting,
  } = bnb

  const {
    daily_projection: daily,
    weekly_projection: weekly,
    monthly_projection: monthly,
    annual_projection: annual,
  } = revenue_forcasting

  return (
    <div className="card mb-4">
      <div className="card-body">
        <h2 className="card-title">{name}</h2>
        <p className="card-text">
          <small className="text-muted">Located in {location}</small>
        </p>
        <h6 className="card-subtitle mb-2 text-muted">
          Number of rooms: {num_of_rooms}
        </h6>
        <h6 className="card-subtitle mb-2 text-muted">
          Cost per night: ${cost_per_night}
        </h6>
        <h6 className="card-subtitle mb-2 text-muted">
          Average Age of Guests: {avg_guest_age}
        </h6>
        <h6 className="card-subtitle mb-2 text-muted">
          Consider hosting: {bnb_activity}
        </h6>

        <div className="table-responsive">
          <table className="table table-bordered">
            <thead>
              <tr>
                <th>All-time Revenue</th>
                <th>Daily Projection</th>
                <th>Weekly Projection</th>
                <th>Monthly Projection</th>
                <th>Annual Projection</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>${total_revenue}</td>
                <td>${daily}</td>
                <td>${weekly}</td>
                <td>${monthly}</td>
                <td>${annual}</td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  )
}

export default StatCard
