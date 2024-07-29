import React, { useState, useEffect } from "react"
import ShoeCollection from "./ShoeCollection"
import RunHistory from "./RunHistory"
import AddUserForm from "./AddUserForm"
import RunnerDetails from "./RunnerDetails"

const App = () => {
  const [users, setUsers] = useState([])
  const [currentUser, setCurrentUser] = useState(null)

  useEffect(() => {
    // Fetch the initial list of users from the backend
    fetch("/api/runners")
      .then((response) => response.json())
      .then((data) => {
        setUsers(data)
        if (data.length > 0) {
          setCurrentUser(data[0].id)
        }
      })
  }, [])

  const addUser = (newUser) => {
    setUsers([...users, newUser])
    setCurrentUser(newUser.id)
  }

  const handleUserChange = (e) => {
    setCurrentUser(e.target.value)
  }

  return (
    <div>
      <h1>My Fitness App</h1>

      <div>
        <label>
          Select User:
          <select value={currentUser} onChange={handleUserChange}>
            {users.map((user) => (
              <option key={user.id} value={user.id}>
                {user.name}
              </option>
            ))}
          </select>
        </label>
      </div>

      <AddUserForm addUser={addUser} />

      {currentUser && (
        <>
          <RunnerDetails userId={currentUser} />
          <ShoeCollection userId={currentUser} />
          <RunHistory userId={currentUser} />
        </>
      )}
    </div>
  )
}

export default App
