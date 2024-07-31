import React, { useState } from "react"

const AddRunForm = ({ addRun, currentRunner }) => {
  const [shoeID, setShoeID] = useState("")

  const handleSubmit = (e) => {
    e.preventDefault()
    const newRun = {
      runnerId: currentRunner.id,
      shoeId: shoeID,
    }
    addRun(newRun)
    setShoeID("")
  }

  return (
    <form onSubmit={handleSubmit}>
      <h2>Add New Run</h2>
      <div>
        <label>
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
