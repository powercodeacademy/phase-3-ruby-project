import React from "react"

const ToolCard = ({ tool }) => {
  return (
    <div className="tool-card">
      <img src={tool.image} alt={tool.name} />
      <h3>{tool.name}</h3>
      <p>{tool.description}</p>
      <p>Category: {tool.category}</p>
      <p>Price per Day: ${tool.price_per_day}</p>
      <p>Available: {tool.availability ? "Yes" : "No"}</p>
    </div>
  )
}

export default ToolCard

// const fetchTools = async () => {
//   try {
//     const response = await fetch(
//       `http://localhost:9292/tools?sort_by=${sort}`
//     )
//     if (response.ok) {
//       const data = await response.json()
//       setTools(data)
//     }
//   } catch (error) {
//     console.error("Failed to fetch tools:", error)
//   }
// }
