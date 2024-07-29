import React, { useState, useEffect } from "react"
import AddRunForm from "./AddRunForm"

const RunHistory = () => {
  const [runs, setRuns] = useState([])

  // useEffect(() => {
  //   // Fetch the initial list of runs from the backend
  //   fetch("/api/runs")
  //     .then((response) => response.json())
  //     .then((data) => setRuns(data))
  // }, [])

  const addRun = (newRun) => {
    setRuns([...runs, newRun])
  }

  return (
    <div>
      <h1>Run History</h1>
      <ul>
        {runs.map((run) => (
          <li key={run.id}>
            {run.distance} miles on {new Date(run.date).toLocaleDateString()}
          </li>
        ))}
      </ul>
      <AddRunForm addRun={addRun} />
    </div>
  )
}

export default RunHistory
