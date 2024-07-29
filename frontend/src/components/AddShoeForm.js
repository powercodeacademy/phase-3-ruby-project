import React, { useState } from "react"

const AddShoeForm = ({ currentRunner, setCurrentRunner, addShoe }) => {
  const [name, setName] = useState("")

  const handleSubmit = (e) => {
    e.preventDefault()
    const newShoe = { name: name, runnerId: currentRunner.id }

    // Send the new shoe to the backend
    fetch("http://127.0.0.1:9292/shoes", {
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
      })
      .catch((error) => {
        console.error("Error adding shoe:", error)
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
      <button type="submit">Add Shoe</button>
    </form>
  )
}

export default AddShoeForm
