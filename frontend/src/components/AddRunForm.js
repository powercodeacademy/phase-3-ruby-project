import React, { useState } from "react"

const AddRunForm = ({ addRun }) => {
  const [distance, setDistance] = useState("")
  const [date, setDate] = useState("")

  const handleSubmit = (e) => {
    // e.preventDefault()
    // const newRun = { distance: parseInt(distance, 10), date }
    // fetch("/api/runs", {
    //   method: "POST",
    //   headers: {
    //     "Content-Type": "application/json",
    //   },
    //   body: JSON.stringify(newRun),
    // })
    //   .then((response) => response.json())
    //   .then((data) => {
    //     addRun(data)
    //     setDistance("")
    //     setDate("")
    //   })
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
          Date:
          <input
            type="date"
            value={date}
            onChange={(e) => setDate(e.target.value)}
            required
          />
        </label>
      </div>
      <button type="submit">Add Run</button>
    </form>
  )
}

export default AddRunForm
