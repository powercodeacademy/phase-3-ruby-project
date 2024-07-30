import React, { useState, useEffect } from "react"
import AddRunForm from "./AddRunForm"

const RunHistory = ({ currentRunner, updateRunner }) => {
  const [runs, setRuns] = useState([])

  useEffect(() => {
    if (currentRunner) {
      setRuns(currentRunner.runs)
    }
  }, [currentRunner])

  const addRun = (newRun) => {
    const updatedRuns = [...runs, newRun]
    setRuns([...runs, newRun])
    updateRunner({ ...currentRunner, runs: updatedRuns })
  }

  return (
    <div>
      <h1>Run History</h1>
      <ul>
        {runs.map((run) => (
          <li key={run.id}>
            {run.distance} miles on {run.created_at}
          </li>
        ))}
      </ul>
      <AddRunForm addRun={addRun} currentRunner={currentRunner} />
    </div>
  )
}

export default RunHistory
