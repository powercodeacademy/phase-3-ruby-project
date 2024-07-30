import React from "react"
import "bootstrap/dist/css/bootstrap.min.css"

function StayEntry({ entry }) {
  const { check_in, check_out } = entry
  return (
    <tr>
      <td>{check_in}</td>
      <td>{check_out}</td>
      <td>Anon</td>
    </tr>
  )
}

export default StayEntry
