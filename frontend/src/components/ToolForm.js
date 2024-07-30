import React, { useState } from "react"

const ToolForm = ({ onAddTool }) => {
  const [name, setName] = useState("")
  const [description, setDescription] = useState("")
  const [pricePerDay, setPricePerDay] = useState("")
  const [availability, setAvailability] = useState(true)
  const [category, setCategory] = useState("")
  const [image, setImage] = useState("")

  const handleSubmit = (e) => {
    e.preventDefault()

    const newTool = {
      name,
      description,
      price_per_day: parseFloat(pricePerDay),
      availability,
      category,
      image,
    }

    fetch("http://localhost:9292/tools", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify(newTool),
    })
      .then((response) => response.json())
      .then((toolData) => {
        onAddTool(toolData)
        setName("")
        setDescription("")
        setPricePerDay("")
        setAvailability(true)
        setCategory("")
        setImage("")
      })
      .catch((error) => console.error("Failed to add tool:", error))
  }

  return (
    <form onSubmit={handleSubmit}>
      <div>
        <label htmlFor="name">Name:</label>
        <input
          type="text"
          id="name"
          value={name}
          onChange={(e) => setName(e.target.value)}
          required
        />
      </div>
      <div>
        <label htmlFor="description">Description:</label>
        <input
          type="text"
          id="description"
          value={description}
          onChange={(e) => setDescription(e.target.value)}
          required
        />
      </div>
      <div>
        <label htmlFor="pricePerDay">Price Per Day:</label>
        <input
          type="number"
          id="pricePerDay"
          value={pricePerDay}
          onChange={(e) => setPricePerDay(e.target.value)}
          required
        />
      </div>
      <div>
        <label htmlFor="availability">Availability:</label>
        <input
          type="checkbox"
          id="availability"
          checked={availability}
          onChange={(e) => setAvailability(e.target.checked)}
        />
      </div>
      <div>
        <label htmlFor="category">Category:</label>
        <input
          type="text"
          id="category"
          value={category}
          onChange={(e) => setCategory(e.target.value)}
          required
        />
      </div>
      <div>
        <label htmlFor="image">Image URL:</label>
        <input
          type="text"
          id="image"
          value={image}
          onChange={(e) => setImage(e.target.value)}
        />
      </div>
      <button type="submit">Add Tool</button>
    </form>
  )
}

export default ToolForm
