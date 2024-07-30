import React, { useState, useEffect } from "react"
import ToolCard from "./ToolCard"

const ToolsList = () => {
  const [tools, setTools] = useState([])
  const [sort, setSort] = useState("name") // default sort

  useEffect(() => {
    fetchTools()
  }, [sort])

  const fetchTools = async () => {
    try {
      const response = await fetch(
        `http://localhost:9292/tools?sort_by=${sort}`
      )
      if (response.ok) {
        const data = await response.json()
        setTools(data)
      }
    } catch (error) {
      console.error("Failed to fetch tools:", error)
    }
  }

  const handleSortChange = (event) => {
    setSort(event.target.value)
  }

  return (
    <div>
      <h1>Tools</h1>
      <label>
        Sort by:
        <select value={sort} onChange={handleSortChange}>
          <option value="name">Name</option>
          <option value="available">Available</option>
        </select>
      </label>
      <div className="tool-list">
        {tools.map((tool) => (
          <ToolCard key={tool.id} tool={tool} />
        ))}
      </div>
    </div>
  )
}

export default ToolsList
