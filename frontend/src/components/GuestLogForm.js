import React, { useState } from "react"
import "bootstrap/dist/css/bootstrap.min.css"

function GuestLogForm({ entry, addNewLogEntry }) {
  const { bnb_id, check_in, guest_id, id } = entry
  const [newMessage, setNewMessage] = useState("")

  const handleSubmit = (e) => {
    e.preventDefault()
    const newEntry = {
      entry_date: check_in,
      message: newMessage,
      bnb_id: bnb_id,
      guest_id: guest_id,
      stay_id: id,
    }

    fetch("http://localhost:9292/guest_log", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify(newEntry),
    })
      .then((r) => r.json())
      .then((createdEntry) => {
        setNewMessage("")
        addNewLogEntry(createdEntry)
      })
      .catch((error) => console.error("Error adding log entry:", error))
  }

  return (
    <form onSubmit={handleSubmit} className="text-center">
      <div className="form-group">
        <label htmlFor="message">Message</label>
        <textarea
          id="message"
          className="form-control"
          value={newMessage}
          onChange={(e) => setNewMessage(e.target.value)}
          required
        />
      </div>
      <button type="submit" className="button-74">
        Add Entry
      </button>
    </form>
  )
}

export default GuestLogForm
