import React, { useState } from "react"

const AddRunnerForm = ({ addRunner }) => {
  const [name, setName] = useState("")

  const handleSubmit = (e) => {
    e.preventDefault()
    const newRunner = { name: name } // Shoes will be handled automatically on the backend

    // Send the new runner to the backend
    fetch("http://127.0.0.1:9292/runners", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify(newRunner),
    })
      .then((response) => response.json())
      .then((data) => {
        addRunner(data)
        setName("")
      })
      .catch((error) => {
        console.error("Error adding runner:", error)
      })
  }

  return (
    <form onSubmit={handleSubmit}>
      <h2>Add New Runner</h2>
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
      <button type="submit">Add Runner</button>
    </form>
  )
}

export default AddRunnerForm
