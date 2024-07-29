import "./App.css"
import Sidebar from "./sidebar"
import { BrowserRouter as Router } from "react-router-dom"

function App() {
  return (
    <Router>
      <div className="App"></div>
      <Sidebar></Sidebar>
    </Router>
  )
}

export default App
