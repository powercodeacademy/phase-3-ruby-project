import React from "react"
import "bootstrap/dist/css/bootstrap.min.css"

function StatCard({ bnb }) {
  const {
    name,
    location,
    description,
    total_revenue,
    num_of_rooms,
    cost_per_night,
  } = bnb

  const dailyProjection = (cost_per_night * num_of_rooms).toFixed(2)

  const weeklyProjection = (dailyProjection * 7).toFixed(2)
  const monthlyProjection = (dailyProjection * 30).toFixed(2)
  const annualProjection = (dailyProjection * 365).toFixed(2)

  return (
    <div className="card mb-4">
      <div className="card-body">
        <h2 className="card-title">{name}</h2>
        <h6 className="card-subtitle mb-2 text-muted">
          Total Revenue: ${total_revenue}
        </h6>
        <p className="card-text">{description}</p>
        <p className="card-text">
          <small className="text-muted">Located in {location}</small>
        </p>
        <p className="card-text">
          <small className="text-muted">Number of rooms: {num_of_rooms}</small>
        </p>
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
                <td>${dailyProjection}</td>
                <td>${weeklyProjection}</td>
                <td>${monthlyProjection}</td>
                <td>${annualProjection}</td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  )
}

export default StatCard
