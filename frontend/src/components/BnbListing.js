import React, { useEffect, useState } from "react"
import { Link } from "react-router-dom"

function BnbListing({ bnb }) {
  const { id, name, location, num_of_rooms, cost_per_night, description } = bnb

  const [guestLog, setGuestLog] = useState([])

  // function getGuestLog() {
  //   console.log(id)

  //   fetch(`http://localhost:9292//bnbs/${id}/guest_log`)
  //     .then((r) => r.json())
  //     .then((entries) => console.log(entries))
  // }

  const getGuestLog = () => {
    return fetch(`http://localhost:9292//bnbs/${id}/guest_log`)
      .then((r) => r.json())
      .then((entries) => console.log(entries))
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
        <Link to="/guest_log">View Guest Log</Link>
      </button>
      <button>
        <Link to="/booking_form">Book Now</Link>
      </button>
    </div>
  )
}

export default BnbListing
