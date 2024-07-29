import React, { useState, useEffect } from "react"
import AddShoeForm from "./AddShoeForm"

const ShoeCollection = ({ currentRunner }) => {
  const [shoes, setShoes] = useState(currentRunner.shoes)

  useEffect(() => {
    if (currentRunner) {
      setShoes(currentRunner.shoes)
    }
  }, [currentRunner])

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
