import "./App.css"
import React, { useEffect, useState } from "react"
import NavBar from "./components/NavBar"
import BnbListing from "./components/BnbListing"

function App() {
  const [allBnbs, setAllBnbs] = useState([])

  useEffect(() => {
    fetch("http://localhost:9292/bnbs/sort_by_price")
      .then((r) => r.json())
      .then((bnbs) => setAllBnbs(bnbs))
  }, [])

  return (
    <div>
      <h1>CareBNB</h1>
      <div>
        {allBnbs.map((bnb) => {
          return <BnbListing key={bnb.name} bnb={bnb} />
        })}
      </div>
    </div>
  )
}

export default App
