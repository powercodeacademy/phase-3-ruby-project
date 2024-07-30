import React, { useState, useEffect } from "react"
import AddShoeForm from "./AddShoeForm"

const ShoeCollection = ({ currentRunner, updateRunner }) => {
  const [shoes, setShoes] = useState(currentRunner.shoes)

  useEffect(() => {
    if (currentRunner) {
      setShoes(currentRunner.shoes)
    }
  }, [currentRunner])

  const addShoe = (newShoe) => {
    const updatedShoes = [...shoes, newShoe]
    setShoes([...shoes, newShoe])
    updateRunner({ ...currentRunner, shoes: updatedShoes })
  }

  return (
    <div>
      <h1>Shoe Collection</h1>
      {currentRunner.shoes.length > 0 ? (
        <ul>
          {shoes.map((shoe) => (
            <li key={shoe.id}>
              {shoe.name} - {shoe.mileage} miles
            </li>
          ))}
        </ul>
      ) : (
        <p>No shoes available.</p>
      )}
      <AddShoeForm addShoe={addShoe} currentRunner={currentRunner} />
    </div>
  )
}

export default ShoeCollection
