import React from "react"
import "bootstrap/dist/css/bootstrap.min.css"

function StayEntry({ entry }) {
  const { check_in, check_out, guest } = entry
  return (
    <tr>
      <td>{check_in}</td>
      <td>{check_out}</td>
      <td>{guest.name}</td>
    </tr>
  )
}

export default StayEntry
