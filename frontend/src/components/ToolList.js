import React, { useState, useEffect } from "react"
import ToolCard from "./ToolCard"
import ToolForm from "./ToolForm"

const ToolsList = () => {
  const [tools, setTools] = useState([])
  const [sort, setSort] = useState("name")
  const [showForm, setShowForm] = useState(false)

  useEffect(() => {
    fetchTools()
  }, [sort])

  const fetchTools = () => {
    fetch(`http://localhost:9292/tools?sort_by=${sort}`)
      .then((response) => response.json())
      .then((toolData) => setTools(toolData))
      .catch((error) => console.error("Failed to fetch tools:", error))
  }

  const handleSortChange = (event) => {
    setSort(event.target.value)
  }

  const handleAddTool = (newTool) => {
    setTools([...tools, newTool])
    setShowForm(false)
  }

  return (
    <div>
      <h1>Tools</h1>
      <label>
        Sort by:
        <select value={sort} onChange={handleSortChange}>
          <option value="name">Name</option>
          <option value="available">Available</option>
          <option value="category">Tool Category</option>
        </select>
      </label>

      <button onClick={() => setShowForm(!showForm)}>
        {showForm ? "Close Form" : "Add Tool"}
      </button>

      {showForm && <ToolForm onAddTool={handleAddTool} />}

      <div className="tools-list">
        {tools.map((tool) => (
          <ToolCard key={tool.id} tool={tool} />
        ))}
      </div>
    </div>
  )
}

export default ToolsList
