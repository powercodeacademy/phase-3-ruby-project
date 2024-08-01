import React, { useEffect, useState } from "react"
import NavBar from "./NavBar"
import StatCard from "./StatCard"

function StatsPortal() {
  const [allBnbs, setAllBnbs] = useState([])

  useEffect(() => {
    fetch("http://localhost:9292/bnbs")
      .then((r) => r.json())
      .then((bnbs) => setAllBnbs(bnbs))
      .catch((error) => console.log(error))
  }, [])

  return (
    <div className="container mt-5">
      <NavBar />
      <h1 className="mb-4 text-center">Insights</h1>
      <div>
        {allBnbs.map((bnb) => {
          return <StatCard key={bnb.name} bnb={bnb} />
        })}
      </div>
    </div>
  )
}

export default StatsPortal
