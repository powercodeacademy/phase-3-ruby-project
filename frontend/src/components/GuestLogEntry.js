import React, { useState } from "react"
import "bootstrap/dist/css/bootstrap.min.css"

function GuestLogEntry({
  entry,
  updateGuestLogEntry,
  getGuestLog,
  onDeleteEntry,
}) {
  const { message, entry_date, guest, id } = entry
  const [showEditInput, setShowEditInput] = useState(false)
  const [newMessage, setNewMessage] = useState(message)

  const toggleEntryForm = () => {
    setShowEditInput(!showEditInput)
  }

  function handleInputChange(e) {
    setNewMessage(e.target.value)
  }

  const handleSaveChanges = (e) => {
    e.preventDefault()

    fetch(`http://localhost:9292/guest_log/${id}`, {
      method: "PATCH",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify({
        newMessage: newMessage,
      }),
    })
      .then((r) => r.json())
      .then((updatedEntry) => {
        updateGuestLogEntry(updatedEntry)
        setShowEditInput(false)
        getGuestLog()
      })
      .catch((error) => console.log(error))
  }

  function handleDeleteClick() {
    fetch(`http://localhost:9292/guest_log/${id}`, {
      method: "DELETE",
    })
      .then(() => {
        onDeleteEntry(id)
      })
      .catch((error) => console.log(error))
  }

  return (
    <tr>
      <td>{entry_date}</td>
      <td>
        {showEditInput ? (
          <form onSubmit={handleSaveChanges}>
            <input
              type="text"
              value={newMessage}
              onChange={handleInputChange}
              required
            />
            <button type="submit" className="button-74">
              Save Changes
            </button>
          </form>
        ) : (
          `${message} - ${guest ? guest.name : "Guest"}`
        )}
      </td>
      <td>
        <button onClick={toggleEntryForm} className="button-74">
          Edit log entry
        </button>
        <button className="button-74" onClick={handleDeleteClick}>
          Delete Entry
        </button>
      </td>
    </tr>
  )
}

export default GuestLogEntry
