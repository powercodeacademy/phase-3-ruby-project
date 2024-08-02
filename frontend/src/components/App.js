import React, { useState, useEffect } from "react"
import ShoeCollection from "./ShoeCollection"
import RunHistory from "./RunHistory"
import AddRunnerForm from "./AddRunnerForm"
import RunnerStats from "./RunnerStats"
import "./style.css"

const App = () => {
  const [runners, setRunners] = useState([])
  const [currentRunner, setCurrentRunner] = useState(null)

  useEffect(() => {
    fetch("http://127.0.0.1:9292/runners")
      .then((response) => response.json())
      .then((data) => {
        setRunners(data)
        setCurrentRunner(data[0])
      })
      .catch((error) => {
        console.error("Error fetching runners:", error)
      })
  }, [])

  const updateRunners = (newRunners) => {
    if (Array.isArray(newRunners)) {
      setRunners(newRunners)
      if (currentRunner) {
        const updatedRunner = newRunners.find(
          (runner) => runner.id === currentRunner.id
        )
        setCurrentRunner(updatedRunner)
      }
    }
  }

  const addShoe = (newShoe) => {
    fetch("http://127.0.0.1:9292/shoes", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify(newShoe),
    })
      .then((response) => response.json())
      .then(updateRunners)
      .catch((error) => {
        console.error("Error adding shoe:", error)
      })
  }

  const addRunner = (newRunner) => {
    fetch("http://127.0.0.1:9292/runners", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify(newRunner),
    })
      .then((response) => response.json())
      .then((resp) => updateRunners(resp))
      .catch((error) => {
        console.error("Error adding runner:", error)
      })
  }

  const addRun = (newRun) => {
    fetch("http://127.0.0.1:9292/runs", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify({ ...newRun, runnerId: currentRunner.id }),
    })
      .then((response) => response.json())
      .then(updateRunners)
      .catch((error) => {
        console.error("Error adding run:", error)
      })
  }

  const handleChange = (e) => {
    const selectedRunnerId = parseInt(e.target.value, 10)
    const selectedRunner = runners.find(
      (runner) => runner.id === selectedRunnerId
    )
    setCurrentRunner(selectedRunner)
  }

  return (
    <div className="container, card text-dark bg-info mb-3">
      <h1 className="header">Run Tracker App</h1>

      <div className="select-runner">
        <label>
          Select Runner:
          <select
            value={currentRunner ? currentRunner.id : ""}
            onChange={handleChange}
          >
            <option value="">Select a runner</option>
            {Array.isArray(runners) &&
              runners.map((runner) => (
                <option key={runner.id} value={runner.id}>
                  {runner.name}
                </option>
              ))}
          </select>
        </label>
      </div>
      {currentRunner && (
        <>
          <AddRunnerForm addRunner={addRunner} />
          <ShoeCollection
            shoes={currentRunner.shoes}
            addShoe={addShoe}
            currentRunner={currentRunner}
          />
          <RunHistory
            currentRunner={currentRunner}
            updateRunners={updateRunners}
            addRun={addRun}
          />
          <RunnerStats currentRunner={currentRunner} />
        </>
      )}
    </div>
  )
}

export default App
