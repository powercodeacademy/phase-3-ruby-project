import React from "react"
import "bootstrap/dist/css/bootstrap.min.css"

function StaysList() {
  return (
    <tr>
      <td>{entry_date}</td>
      <td>
        {message} - {guest.name}
      </td>
    </tr>
  )
}

export default StaysList
