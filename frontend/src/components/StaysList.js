import React from "react"
import "bootstrap/dist/css/bootstrap.min.css"
import StayEntry from "./StayEntry"

function StaysList({
  staysList,
  onDeleteStay,
  getGuestLog,
  handleDeleteGuestLogEntry,
}) {
  return (
    <table className="table table-striped">
      <thead>
        <tr>
          <th>Check-In</th>
          <th>Check-Out</th>
          <th>Guest Name</th>
        </tr>
      </thead>
      <tbody>
        {staysList.map((entry) => {
          return (
            <StayEntry
              key={entry.id}
              entry={entry}
              onDeleteStay={onDeleteStay}
              getGuestLog={getGuestLog}
              handleDeleteGuestLogEntry={handleDeleteGuestLogEntry}
            />
          )
        })}
      </tbody>
    </table>
  )
}

export default StaysList
