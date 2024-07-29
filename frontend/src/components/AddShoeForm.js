import React, { useState } from "react"

const AddShoeForm = ({ addShoe }) => {
  const [name, setName] = useState("")
  const [mileage, setMileage] = useState("")

  const handleSubmit = (e) => {
    e.preventDefault()
    const newShoe = { name, mileage: parseInt(mileage, 10) }

    // Send the new shoe to the backend
    fetch("/api/shoes", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify(newShoe),
    })
      .then((response) => response.json())
      .then((data) => {
        addShoe(data)
        setName("")
        setMileage("")
      })
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
      <div>
        <label>
          Mileage:
          <input
            type="number"
            value={mileage}
            onChange={(e) => setMileage(e.target.value)}
            required
          />
        </label>
      </div>
      <button type="submit">Add Shoe</button>
    </form>
  )
}

export default AddShoeForm
