import React, { useState } from "react"

const AddUserForm = ({ addUser }) => {
  const [name, setName] = useState("")

  const handleSubmit = (e) => {
    e.preventDefault()
    const newUser = { name }

    // Send the new user to the backend
    fetch("/api/users", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify(newUser),
    })
      .then((response) => response.json())
      .then((data) => {
        addUser(data)
        setName("")
      })
  }

  return (
    <form onSubmit={handleSubmit}>
      <h2>Add New User</h2>
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
      <button type="submit">Add User</button>
    </form>
  )
}

export default AddUserForm
