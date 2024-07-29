import React, { useState, useEffect } from "react"
import ShoeCollection from "./ShoeCollection"
import RunHistory from "./RunHistory"
import AddRunnerForm from "./AddRunnerForm"

const App = () => {
  const [runners, setRunners] = useState([])
  const [currentRunner, setCurrentRunner] = useState(null)

  useEffect(() => {
    fetch("http://127.0.0.1:9292/runners")
      .then((response) => response.json())
      .then((data) => {
        setRunners(data)
        if (data.length > 0) {
          setCurrentRunner(data[0])
        }
      })
      .catch((error) => {
        console.error("Error fetching runners:", error)
      })
  }, [])

  const addRunner = (newRunner) => {
    setRunners([...runners, newRunner])
    setCurrentRunner(newRunner)
  }

  const handleRunnerChange = (e) => {
    const selectedRunner = runners.find(
      (runner) => runner.id === parseInt(e.target.value, 10)
    )
    setCurrentRunner(selectedRunner)
  }

  return (
    <div>
      <h1>My Fitness App</h1>

      <div>
        <label>
          Select Runner:
          <select
            value={currentRunner ? currentRunner.id : ""}
            onChange={handleRunnerChange}
          >
            <option value="">Select a runner</option>
            {runners.map((runner) => (
              <option key={runner.id} value={runner.id}>
                {runner.name}
              </option>
            ))}
          </select>
        </label>
      </div>

      <AddRunnerForm addRunner={addRunner} />

      {currentRunner && (
        <>
          <ShoeCollection currentRunner={currentRunner} />
          <RunHistory currentRunner={currentRunner} />
        </>
      )}
    </div>
  )
}

export default App
