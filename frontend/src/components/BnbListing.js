import React, { useState, useEffect } from "react"
import GuestLog from "./GuestLog"
import "bootstrap/dist/css/bootstrap.min.css"
import "../App.css"
import StaysList from "./StaysList"
import BookingForm from "./BookingForm"

function BnbListing({ bnb }) {
  const {
    id,
    name,
    location,
    num_of_rooms,
    cost_per_night,
    description,
    total_revenue,
    bnb_activity,
  } = bnb
  const [guestLog, setGuestLog] = useState([])
  const [staysList, setStaysList] = useState([])

  const [showGuestLog, setShowGuestLog] = useState(false)
  const [showStaysList, setShowStaysList] = useState(false)
  const [showBookingForm, setShowBookingForm] = useState(false)

  const [message, setMessage] = useState("")

  const getGuestLog = () => {
    fetch(`http://localhost:9292/bnbs/${id}/guest_log`)
      .then((r) => r.json())
      .then((entries) => setGuestLog(entries))
  }

  const getStayList = () => {
    fetch(`http://localhost:9292/bnbs/${id}/stays_list`)
      .then((r) => r.json())
      .then((entries) => setStaysList(entries))
  }

  const handleStayListClick = () => {
    if (!showStaysList) {
    }
    setShowStaysList(!showStaysList)
  }

  const handleGuestLogClick = () => {
    if (!showGuestLog) {
    }
    setShowGuestLog(!showGuestLog)
  }

  const toggleBookingForm = () => {
    setShowBookingForm(!showBookingForm)
  }

  const handleDeleteStay = (stayId) => {
    setStaysList((prevStays) => prevStays.filter((stay) => stay.id !== stayId))
  }

  const updateGuestLogEntry = (updatedEntry) => {
    setGuestLog((prevEntries) =>
      prevEntries.map((entry) =>
        entry.id === updatedEntry.id ? updatedEntry : entry
      )
    )
  }

  const handleDeleteGuestLogEntry = (entryId) => {
    setGuestLog((prevEntries) =>
      prevEntries.filter((entry) => entry.id !== entryId)
    )
  }

  useEffect(() => {
    getGuestLog()
  }, [])

  useEffect(() => {
    getStayList()
  }, [])

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
        <button className="button-74" onClick={handleGuestLogClick}>
          {showGuestLog ? "Hide Guest Log" : "View Guest Log"}
        </button>
        {showGuestLog && (
          <GuestLog
            guestLog={guestLog}
            message={message}
            setMessage={setMessage}
            getGuestLog={getGuestLog}
            updateGuestLogEntry={updateGuestLogEntry}
            onDeleteEntry={handleDeleteGuestLogEntry}
          />
        )}
        <button className="button-74" onClick={handleStayListClick}>
          {showStaysList ? "Hide Stays List" : "View Stays List"}
        </button>
        {showStaysList && (
          <StaysList
            staysList={staysList}
            onDeleteStay={handleDeleteStay}
            getGuestLog={getGuestLog}
          />
        )}
        <p>Total Revenue: {total_revenue} --</p>
        <p>Daily Activity: {bnb_activity}</p>
      </div>
    </div>
  )
}

export default BnbListing
