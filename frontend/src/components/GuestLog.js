import React from "react"
import GuestLogEntry from "./GuestLogEntry"
import "bootstrap/dist/css/bootstrap.min.css"

function GuestLog({ guestLog }) {
  return (
    <table className="table table-striped">
      <thead>
        <tr>
          <th>Entry Date</th>
          <th>Message</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>2024-07-29</td>
          <td>Sample message content</td>
        </tr>
        {guestLog.map((entry) => {
          return <GuestLogEntry key={entry.id} entry={entry} />
        })}
      </tbody>
    </table>
  )
}

export default GuestLog
