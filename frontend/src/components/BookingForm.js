import React, { useState } from "react"
import "bootstrap/dist/css/bootstrap.min.css"

function BookingForm({ bnb }) {
  const { id } = bnb
  const [guestName, setGuestName] = useState("")
  const [guestAge, setGuestAge] = useState("") // Add age field if needed
  const [checkIn, setCheckIn] = useState("")
  const [checkOut, setCheckOut] = useState("")

  const handleSubmit = (e) => {
    e.preventDefault()
    const newStay = {
      name: guestName,
      age: guestAge, // Include age if needed
      check_in: checkIn,
      check_out: checkOut,
      bnb_id: id,
    }

    fetch(`http://localhost:9292/create_guest_and_stay`, {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify(newStay),
    })
      .then((r) => r.json())
      .then(() => {
        setGuestName("")
        setGuestAge("") // Reset age field
        setCheckIn("")
        setCheckOut("")
      })
  }

  return (
    <form onSubmit={handleSubmit} className="text-center">
      <div className="form-group">
        <label htmlFor="guestName">Guest Name</label>
        <input
          type="text"
          id="guestName"
          className="form-control"
          value={guestName}
          onChange={(e) => setGuestName(e.target.value)}
          required
        />
      </div>
      <div className="form-group">
        <label htmlFor="guestAge">Guest Age</label>
        <input
          type="number"
          id="guestAge"
          className="form-control"
          value={guestAge}
          onChange={(e) => setGuestAge(e.target.value)}
        />
      </div>
      <div className="form-group">
        <label htmlFor="startDate">Check In</label>
        <input
          type="date"
          id="startDate"
          className="form-control"
          value={checkIn}
          onChange={(e) => setCheckIn(e.target.value)}
          required
        />
      </div>
      <div className="form-group">
        <label htmlFor="endDate">Check Out</label>
        <input
          type="date"
          id="endDate"
          className="form-control"
          value={checkOut}
          onChange={(e) => setCheckOut(e.target.value)}
          required
        />
      </div>
      <button type="submit" className="button-74">
        Book Stay
      </button>
    </form>
  )
}

export default BookingForm
