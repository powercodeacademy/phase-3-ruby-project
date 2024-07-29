import "./App.css"
import Sidebar from "./sidebar"
import "bootstrap-icons/font/bootstrap-icons.css"
import { BrowserRouter as Router } from "react-router-dom"

function App() {
  return (
    <Router>
      <div className="App"></div>
      <Sidebar />
    </Router>
  )
}

export default App
