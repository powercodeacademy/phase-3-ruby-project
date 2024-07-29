import React, { useState } from "react"
import GuestLog from "./GuestLog"

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
    <div>
      <h2>{name}</h2>
      <span>
        Number of Rooms {num_of_rooms} - Cost /Night ${cost_per_night}
      </span>
      <p>{description}</p>
      <p>Located in {location}</p>
      <button onClick={getGuestLog}>
        {showGuestLog ? "Hide Guest Log" : "View Guest Log"}
      </button>
      {showGuestLog && <GuestLog guestLog={guestLog} />}
    </div>
  )
}

export default BnbListing
