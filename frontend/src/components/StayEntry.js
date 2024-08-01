import React, { useState } from "react"
import "bootstrap/dist/css/bootstrap.min.css"
import GuestLogForm from "./GuestLogForm"

function StayEntry({ entry, onDeleteStay, addNewLogEntry }) {
  const [guestLogForm, setGuestLogForm] = useState(false)
  const { check_in, check_out, guest, id } = entry

  const toggleGuestLogForm = () => {
    setGuestLogForm(!guestLogForm)
  }

  function handleDeleteClick() {
    fetch(`http://localhost:9292/stays/${id}`, {
      method: "DELETE",
    })
      .then(() => {
        onDeleteStay(id)
      })
      .catch((error) => console.log(error))
  }

  return (
    <tr>
      <td>{check_in}</td>
      <td>{check_out}</td>
      <td>{guest.name}</td>
      <td>
        <button className="button-74" onClick={toggleGuestLogForm}>
          {guestLogForm ? "Hide Guest Log" : "Sign Guest Log"}
        </button>
        {guestLogForm && (
          <GuestLogForm entry={entry} addNewLogEntry={addNewLogEntry} />
        )}
      </td>
      <td>
        <button className="button-74" onClick={handleDeleteClick}>
          Delete Stay
        </button>
      </td>
    </tr>
  )
}

export default StayEntry
