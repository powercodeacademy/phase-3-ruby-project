import React, { useState } from "react"

const AddRunnerForm = ({ addRunner }) => {
  const [name, setName] = useState("")

  const handleSubmit = (e) => {
    e.preventDefault()
    const newRunner = { name: name }
    addRunner(newRunner)
    setName("")
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
