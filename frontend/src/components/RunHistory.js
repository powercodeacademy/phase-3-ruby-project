import React, { useState, useEffect } from "react"
import AddRunForm from "./AddRunForm"

const RunHistory = ({ currentRunner, updateRunner }) => {
  const [runs, setRuns] = useState([])
  const [editingRunId, setEditingRunId] = useState(null)
  const [currentMileage, setCurrentMileage] = useState("")
  const [shoeID, setShoeID] = useState("")

  useEffect(() => {
    if (currentRunner) {
      setRuns(currentRunner.runs)
    }
  }, [currentRunner])

  const addRun = (newRun) => {
    const updatedRuns = [...runs, newRun]
    setRuns(updatedRuns)
    updateRunner({ ...currentRunner, runs: updatedRuns })
  }

  const deleteRun = (runId) => {
    const updatedRuns = runs.filter((run) => run.id !== runId)

    setRuns(updatedRuns)
    updateRunner({ ...currentRunner, runs: updatedRuns })

    fetch(`http://127.0.0.1:9292/runs/${runId}`, {
      method: "DELETE",
    }).catch((error) => {
      console.error("Error deleting run:", error)
    })
  }

  const handleEditClick = (run) => {
    setEditingRunId(run.id)
    setCurrentMileage(run.distance)
  }

  const handleMileageChange = (e) => {
    setCurrentMileage(e.target.value)
  }

  const handleSaveClick = (runId) => {
    const updatedRuns = runs.map((run) =>
      run.id === runId
        ? { ...run, distance: parseInt(currentMileage, 10), shoeID: shoeID }
        : run
    )
    setRuns(updatedRuns)
    updateRunner({ ...currentRunner, runs: updatedRuns })

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
      .catch((error) => {
        console.error("Error updating run:", error)
      })

    setEditingRunId(null)
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
                  onChange={handleMileageChange}
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
                {run.distance} miles on {run.created_at}
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
