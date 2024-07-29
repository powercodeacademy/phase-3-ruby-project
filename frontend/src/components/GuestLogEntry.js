import React from "react"

function GuestLogEntry({ entry }) {
  const { message, created_at } = entry
  return (
    <tr>
      <td>{created_at}</td>
      <td>{message}</td>
    </tr>
  )
}

export default GuestLogEntry
