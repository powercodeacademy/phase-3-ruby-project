import React, { useState, useEffect } from "react"
import "bootstrap/dist/css/bootstrap.min.css"
import "../App.css"

function StatCard({ bnb }) {
  const { id, name, location, description, total_revenue, bnb_activity } = bnb

  return (
    <div className="card mb-4">
      <div className="card-body">
        <h2 className="card-title">{name} </h2>
        <h6 className="card-subtitle mb-2 text-muted">
          Total Revenue: ${total_revenue}
        </h6>
        <p className="card-text">{description}</p>
        <p className="card-text">
          <small className="text-muted">Located in {location}</small>
        </p>
      </div>
    </div>
  )
}

export default StatCard
