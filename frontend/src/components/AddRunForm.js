import React, { useState } from "react"

const AddRunForm = ({ addRun, currentRunner }) => {
  const [shoeId, setShoeId] = useState("")

  const handleSubmit = (e) => {
    e.preventDefault()
    if (shoeId) {
      const newRun = {
        runnerId: currentRunner.id,
        shoeId: shoeId,
      }
      addRun(newRun)
      setShoeId("")
    }
  }

  return (
    <form onSubmit={handleSubmit}>
      <h2>Add New Run</h2>
      <div>
        <label>
          <select value={shoeId} onChange={(e) => setShoeId(e.target.value)}>
            <option value="">Select a shoe</option>
            {currentRunner.shoes.map((shoe) => (
              <option key={shoe.id} value={shoe.id}>
                {shoe.name}
              </option>
            ))}
          </select>
        </label>
      </div>
      <button className="btn btn-outline-info m-3" type="submit">
        Add Run
      </button>
    </form>
  )
}

export default AddRunForm
