import React, { useState, useEffect } from "react"

const RunnerDetails = ({ userId }) => {
  const [runner, setRunner] = useState(null)

  useEffect(() => {
    // Fetch runner details from the backend
    fetch(`/api/runners/${userId}`)
      .then((response) => response.json())
      .then((data) => setRunner(data))
  }, [userId])

  if (!runner) {
    return <p>Loading...</p>
  }

  const totalDistance = runner.runs.reduce(
    (total, run) => total + run.distance,
    0
  )
  const numberOfRuns = runner.runs.length

  return (
    <div>
      <h2>Runner Details</h2>
      <p>Name: {runner.name}</p>
      <p>Total Distance: {totalDistance} miles</p>
      <p>Number of Runs: {numberOfRuns}</p>
      <ul>
        <h3>Runs:</h3>
        {runner.runs.map((run) => (
          <li key={run.id}>
            {run.distance} miles on {new Date(run.date).toLocaleDateString()}
          </li>
        ))}
      </ul>
    </div>
  )
}

export default RunnerDetails
