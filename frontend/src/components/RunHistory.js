import React, { useState } from "react"
import AddRunForm from "./AddRunForm"

const RunHistory = ({ currentRunner, updateRunners, addRun }) => {
  const [editingRunId, setEditingRunId] = useState(null)
  const [currentMileage, setCurrentMileage] = useState("")
  const [shoeID, setShoeID] = useState("")

  const runs = currentRunner.shoes.flatMap((shoe) =>
    shoe.runs.map((run) => ({ ...run, shoeName: shoe.name }))
  )

  const handleEditClick = (run) => {
    setEditingRunId(run.id)
    setCurrentMileage(run.distance)
    setShoeID(run.shoe_id)
  }

  const handleSaveClick = (runId) => {
    fetch(`http://127.0.0.1:9292/runs/${runId}`, {
      method: "PATCH",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify({
        distance: parseInt(currentMileage, 10),
        shoeID: shoeID,
      }),
    })
      .then((response) => response.json())
      .then(updateRunners)
      .catch((error) => {
        console.error("Error updating run:", error)
      })

    setEditingRunId(null)
  }

  const deleteRun = (runId) => {
    fetch(`http://127.0.0.1:9292/runs/${runId}`, {
      method: "DELETE",
    })
      .then((response) => response.json())
      .then(updateRunners)
      .catch((error) => {
        console.error("Error deleting run:", error)
      })
  }

  return (
    <div>
      <h1>Run History</h1>
      <ul>
        {runs.map((run) => (
          <li key={run.id}>
            {editingRunId === run.id ? (
              <div>
                <input
                  type="number"
                  value={currentMileage}
                  onChange={(e) => setCurrentMileage(e.target.value)}
                />
                Miles -
                <label>
                  Shoe:
                  <select
                    value={shoeID}
                    onChange={(e) => setShoeID(e.target.value)}
                  >
                    <option value="">Select a shoe</option>
                    {currentRunner.shoes.map((shoe) => (
                      <option key={shoe.id} value={shoe.id}>
                        {shoe.name}
                      </option>
                    ))}
                  </select>
                </label>
                <button onClick={() => handleSaveClick(run.id)}>Save</button>
                <button onClick={() => setEditingRunId(null)}>Cancel</button>
              </div>
            ) : (
              <>
                {run.distance} miles on{" "}
                {new Date(run.created_at).toLocaleDateString()} with{" "}
                {run.shoeName}
                <button onClick={() => handleEditClick(run)}>Edit</button>
                <button onClick={() => deleteRun(run.id)}>Delete</button>
              </>
            )}
          </li>
        ))}
      </ul>
      <AddRunForm addRun={addRun} currentRunner={currentRunner} />
    </div>
  )
}

export default RunHistory
