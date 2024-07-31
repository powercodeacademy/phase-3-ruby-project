import React from "react"
import { Link } from "react-router-dom"
import "bootstrap/dist/css/bootstrap.min.css"

const NavBar = () => {
  return (
    <div>
      <nav className=" mb-4 navbar navbar-expand navbar-light bg-light">
        <Link className="navbar-brand" to="/">
          <h1 className="mb-4 text-center">WarmWelcomes</h1>
        </Link>
        <div className="navbar-nav ml-auto">
          <Link className="nav-item nav-link" to="/">
            Home
          </Link>
          <Link className="nav-item nav-link" to="/stats">
            Stats Page
          </Link>
        </div>
      </nav>
    </div>
  )
}

export default NavBar
