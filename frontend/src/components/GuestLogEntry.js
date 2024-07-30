import React, { useState } from "react"
import "bootstrap/dist/css/bootstrap.min.css"

function GuestLogEntry({ entry }) {
  const { message, entry_date, guest } = entry
  const [showEditInput, setShowEditInput] = useState(true)

  const toggleEntryForm = () => {
    setShowEditInput(!showEditInput)
  }

  return (
    <tr>
      <td>{entry_date}</td>
      <td>
        {showEditInput ? (
          message
        ) : (
          <form>
            {" "}
            <input type="text" value={message}></input>
            <button type="submit" className="button-74">
              Book Stay
            </button>
          </form>
        )}{" "}
        - {guest.name}
      </td>
      <td>
        <button onClick={toggleEntryForm} className="button-74">
          Edit log entry
        </button>
      </td>
    </tr>
  )
}

export default GuestLogEntry
