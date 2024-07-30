import React, { useState } from "react"

const AddRunForm = ({ addRun, currentRunner }) => {
  const [distance, setDistance] = useState("")
  const [shoeID, setShoeID] = useState("")

  const handleSubmit = (e) => {
    e.preventDefault()
    const newRun = {
      distance: parseInt(distance, 10),
      runnerId: currentRunner.id,
      shoeID: shoeID,
    }
    debugger
    fetch("http://127.0.0.1:9292/runs", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify(newRun),
    })
      .then((response) => response.json())
      .then((data) => {
        addRun(data)
        setShoeID("")
        setDistance("")
      })
  }

  return (
    <form onSubmit={handleSubmit}>
      <h2>Add New Run</h2>
      <div>
        <label>
          Distance:
          <input
            type="number"
            value={distance}
            onChange={(e) => setDistance(e.target.value)}
            required
          />
        </label>
      </div>
      <div>
        <label>
          Shoe:
          <select value={shoeID} onChange={(e) => setShoeID(e.target.value)}>
            <option value="">Select a shoe</option>
            {currentRunner.shoes.map((shoe) => (
              <option key={shoe.id} value={shoe.id}>
                {shoe.name}
              </option>
            ))}
          </select>
        </label>
      </div>
      <button type="submit">Add Run</button>
    </form>
  )
}

export default AddRunForm
