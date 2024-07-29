import React from "react"

function GuestLogEntry({ entry }) {
  const { message, created_at, guest_id, guest } = entry
  return (
    <tr>
      <td>{created_at}</td>
      <td>
        {message} -- {guest.name}
      </td>
    </tr>
  )
}

export default GuestLogEntry
