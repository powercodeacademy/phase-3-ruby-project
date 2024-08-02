import React from "react"

const RunnerStats = ({ currentRunner }) => {
  if (!currentRunner) {
    return <p>Loading...</p>
  }

  return (
    <div
      className="card text-white bg-secondary
    mb-3"
    >
      <h2>Runner Stats</h2>
      <p>Name: {currentRunner.name}</p>
      <ul>
        {currentRunner.stats.map((stat) => (
          <li key={stat}>{stat}</li>
        ))}
      </ul>
    </div>
  )
}

export default RunnerStats
