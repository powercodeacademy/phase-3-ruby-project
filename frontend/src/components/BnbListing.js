import React, { useState } from "react"
import GuestLog from "./GuestLog"
import "bootstrap/dist/css/bootstrap.min.css"
import "../App.css"

function BnbListing({ bnb }) {
  const { id, name, location, num_of_rooms, cost_per_night, description } = bnb
  const [guestLog, setGuestLog] = useState([])
  const [showGuestLog, setShowGuestLog] = useState(false)

  const getGuestLog = () => {
    if (!showGuestLog) {
      fetch(`http://localhost:9292/bnbs/${id}/guest_log`)
        .then((r) => r.json())
        .then((entries) => setGuestLog(entries))
    }
    setShowGuestLog(!showGuestLog)
  }

  return (
    <div className="card mb-4">
      <div className="card-body">
        <h2 className="card-title">{name}</h2>
        <h6 className="card-subtitle mb-2 text-muted">
          Number of Rooms: {num_of_rooms} - Cost /Night: ${cost_per_night}
        </h6>
        <p className="card-text">{description}</p>
        <p className="card-text">
          <small className="text-muted">Located in {location}</small>
        </p>
        <button className="button-74" onClick={getGuestLog}>
          {showGuestLog ? "Hide Guest Log" : "View Guest Log"}
        </button>
        {showGuestLog && <GuestLog guestLog={guestLog} />}
      </div>
    </div>
  )
}

export default BnbListing
