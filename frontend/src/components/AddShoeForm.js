import React, { useState } from "react"

const AddShoeForm = ({ currentRunner, addShoe }) => {
  const [name, setName] = useState("")

  const handleSubmit = (e) => {
    e.preventDefault()
    const newShoe = { name: name, runner_id: currentRunner.id }
    addShoe(newShoe)
    setName("")
  }

  return (
    <form onSubmit={handleSubmit}>
      <h2>Add New Shoe</h2>
      <div>
        <label>
          Name:
          <input
            type="text"
            value={name}
            onChange={(e) => setName(e.target.value)}
            required
          />
        </label>
      </div>
      <button className="btn btn-outline-info" type="submit">
        Add Shoe
      </button>
    </form>
  )
}

export default AddShoeForm
