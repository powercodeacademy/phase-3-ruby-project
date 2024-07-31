import React, { useState, useEffect } from "react"

const RunnerDetails = ({ currentRunner }) => {
  if (!currentRunner) {
    return <p>Loading...</p>
  }

  return (
    <div>
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

export default RunnerDetails
