import React, { useState } from "react"
import GuestLog from "./GuestLog"
import "bootstrap/dist/css/bootstrap.min.css"
import "../App.css"
import StaysList from "./StaysList"
import BookingForm from "./BookingForm"

function BnbListing({ bnb }) {
  const { id, name, location, num_of_rooms, cost_per_night, description } = bnb
  const [guestLog, setGuestLog] = useState([])
  const [staysList, setStaysList] = useState([])

  const [showGuestLog, setShowGuestLog] = useState(false)
  const [showStaysList, setShowStaysList] = useState(false)
  const [showBookingForm, setShowBookingForm] = useState(false)

  const getGuestLog = () => {
    if (!showGuestLog) {
      fetch(`http://localhost:9292/bnbs/${id}/guest_log`)
        .then((r) => r.json())
        .then((entries) => setGuestLog(entries))
    }
    setShowGuestLog(!showGuestLog)
  }

  const getStaysList = () => {
    if (!showStaysList) {
      fetch(`http://localhost:9292/bnbs/${id}/stays_list`)
        .then((r) => r.json())
        .then((entries) => setStaysList(entries))
    }
    setShowStaysList(!showStaysList)
  }

  const toggleBookingForm = () => {
    setShowBookingForm(!showBookingForm)
  }

  const handleDeleteStay = (stayId) => {
    setStaysList((prevStays) => prevStays.filter((stay) => stay.id !== stayId))
  }

  return (
    <div className="card mb-4">
      <div className="card-body">
        <h2 className="card-title">
          {name}{" "}
          <button onClick={toggleBookingForm} className="button-74">
            Book Now
          </button>
        </h2>
        {showBookingForm && <BookingForm bnb={bnb} />}
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
        <button className="button-74" onClick={getStaysList}>
          {showStaysList ? "Hide Stays List" : "View Stays List"}
        </button>
        {showStaysList && (
          <StaysList staysList={staysList} onDeleteStay={handleDeleteStay} />
        )}
      </div>
    </div>
  )
}

export default BnbListing
