import React from "react"
import "bootstrap/dist/css/bootstrap.min.css"

function GuestLogEntry({ entry }) {
  const { message, entry_date, guest } = entry
  return (
    <tr>
      <td>{entry_date}</td>
      <td>
        {message} - {guest.name}
      </td>
    </tr>
  )
}

export default GuestLogEntry
