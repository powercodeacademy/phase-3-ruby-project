import React, { useState, useEffect } from "react"
import AddShoeForm from "./AddShoeForm"

const ShoeCollection = () => {
  const [shoes, setShoes] = useState([])

  // useEffect(() => {
  //   // Fetch the initial list of shoes from the backend
  //   fetch("/api/shoes")
  //     .then((response) => response.json())
  //     .then((data) => setShoes(data))
  // }, [])

  const addShoe = (newShoe) => {
    setShoes([...shoes, newShoe])
  }

  return (
    <div>
      <h1>Shoe Collection</h1>
      <ul>
        {shoes.map((shoe) => (
          <li key={shoe.id}>
            {shoe.name} - {shoe.mileage} miles
          </li>
        ))}
      </ul>
      <AddShoeForm addShoe={addShoe} />
    </div>
  )
}

export default ShoeCollection
