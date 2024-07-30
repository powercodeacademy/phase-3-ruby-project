import React, { useState } from "react"
import "bootstrap/dist/css/bootstrap.min.css"
import GuestLogForm from "./GuestLogForm"

function StayEntry({ entry }) {
  const [guestLogForm, setGuestLogForm] = useState(false)
  const { check_in, check_out, guest } = entry

  const toggleGuestLogForm = () => {
    setGuestLogForm(!guestLogForm)
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
        {guestLogForm && <GuestLogForm entry={entry} />}
      </td>
    </tr>
  )
}

export default StayEntry
