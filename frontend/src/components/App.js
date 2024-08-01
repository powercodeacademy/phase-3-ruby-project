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
        if (Array.isArray(data)) {
          setRunners(data)
          if (data.length > 0) {
            setCurrentRunner(data[0])
          }
        } else {
          console.error("Expected an array but received:", data)
        }
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
      .then(updateRunners)
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

  return (
    <div className="container, card text-dark bg-info mb-3">
      <h1 className="header">Run Tracker App</h1>

      <div className="select-runner">
        <label>
          Select Runner:
          <select
            value={currentRunner ? currentRunner.id : ""}
            onChange={(e) => {
              const selectedRunner = runners.find(
                (runner) => runner.id === parseInt(e.target.value, 10)
              )
              setCurrentRunner(selectedRunner)
            }}
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
          <div className="section">
            <div class="card text-white bg-secondary mb-3">
              <AddRunnerForm addRunner={addRunner} />
            </div>
          </div>
          <div className="section">
            <div class="card text-white bg-secondary mb-3">
              <ShoeCollection
                shoes={currentRunner.shoes}
                addShoe={addShoe}
                currentRunner={currentRunner}
              />
            </div>
          </div>
          <div className="section">
            <div class="card text-white bg-secondary mb-3">
              <RunHistory
                currentRunner={currentRunner}
                updateRunners={updateRunners}
                addRun={addRun}
              />
            </div>
          </div>
          <div className="section">
            <div
              class="card text-white bg-secondary
             mb-3"
            >
              <RunnerStats currentRunner={currentRunner} />
            </div>
          </div>
        </>
      )}
    </div>
  )
}

export default App
