import React, { useState } from "react"
import AddRunForm from "./AddRunForm"

const RunHistory = ({ currentRunner, updateRunner, addRun }) => {
  const [editingRunId, setEditingRunId] = useState(null)
  const [shoeId, setShoeId] = useState("")

  const runs = currentRunner.shoes.flatMap((shoe) =>
    shoe.runs.map((run) => ({ ...run, shoeName: shoe.name }))
  )

  const handleEditClick = (run) => {
    setEditingRunId(run.id)
    setShoeId(run.shoe_id)
  }

  const handleSaveClick = (runId) => {
    fetch(`http://127.0.0.1:9292/runs/${runId}`, {
      method: "PATCH",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify({
        shoeId: shoeId,
      }),
    })
      .then((response) => response.json())
      .then(updateRunner)
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
      .then(updateRunner)
      .catch((error) => {
        console.error("Error deleting run:", error)
      })
  }

  return (
    <div className="card text-white bg-secondary mb-3">
      <h1>Run History</h1>
      {runs.length === 0 ? (
        <p>
          No runs yet. Add a shoe and select it below to log your first run.
        </p>
      ) : (
        <ul>
          {runs.map((run) => (
            <li key={run.id}>
              {editingRunId === run.id ? (
                <div>
                  {run.distance} miles on{" "}
                  {new Date(run.created_at).toLocaleDateString()} with
                  <label>
                    <select
                      value={shoeId}
                      onChange={(e) => setShoeId(e.target.value)}
                    >
                      <option value="">Select a shoe</option>
                      {currentRunner.shoes.map((shoe) => (
                        <option key={shoe.id} value={shoe.id}>
                          {shoe.name}
                        </option>
                      ))}
                    </select>
                  </label>
                  <button
                    className="btn btn-outline-info m-3"
                    onClick={() => handleSaveClick(run.id)}
                  >
                    Save
                  </button>
                  <button
                    className="btn btn-outline-info m-3"
                    onClick={() => setEditingRunId(null)}
                  >
                    Cancel
                  </button>
                </div>
              ) : (
                <>
                  {run.distance} miles on{" "}
                  {new Date(run.created_at).toLocaleDateString()} with{" "}
                  {run.shoeName}
                  <button
                    className="btn btn-outline-info m-3"
                    onClick={() => handleEditClick(run)}
                  >
                    Change Shoe
                  </button>
                  <button
                    className="btn btn-outline-info m-3"
                    onClick={() => deleteRun(run.id)}
                  >
                    Delete
                  </button>
                </>
              )}
            </li>
          ))}
        </ul>
      )}
      <AddRunForm addRun={addRun} currentRunner={currentRunner} />
    </div>
  )
}

export default RunHistory
