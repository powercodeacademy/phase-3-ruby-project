import React from "react"
import GuestLogEntry from "./GuestLogEntry"
import "bootstrap/dist/css/bootstrap.min.css"

function GuestLog({
  guestLog,
  message,
  setMessage,
  getGuestLog,
  updateGuestLogEntry,
}) {
  return (
    <table className="table table-striped">
      <thead>
        <tr>
          <th>Entry Date</th>
          <th>Message</th>
          <th></th>
        </tr>
      </thead>
      <tbody>
        {guestLog.map((entry) => {
          return (
            <GuestLogEntry
              key={entry.id}
              entry={entry}
              setMessage={setMessage}
              updateGuestLogEntry={updateGuestLogEntry}
              getGuestLog={getGuestLog}
            />
          )
        })}
      </tbody>
    </table>
  )
}

export default GuestLog
