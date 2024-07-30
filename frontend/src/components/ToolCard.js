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
