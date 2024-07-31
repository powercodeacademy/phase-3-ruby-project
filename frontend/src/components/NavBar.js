import { NavLink, useNavigate } from "react-router-dom"

function NavBar() {
  const navigate = useNavigate()

  const handleClick = () => {
    localStorage.removeItem("userId")
    navigate("/")
  }

  return (
    <div className="NavBar">
      <nav className="navbar navbar-expand-md navbar-dark bg-dark">
        <div className="container-fluid">
          <span className="navbar-brand">PlayShelf</span>
          <div className="collapse navbar-collapse" id="navbarNav">
            <ul className="navbar-nav">
              <li className="nav-item">
                <NavLink className="nav-link" to="/board_games">
                  Home
                </NavLink>
              </li>
              <li className="nav-item">
                <NavLink className="nav-link" to="/profile">
                  Profile
                </NavLink>
              </li>
            </ul>
            <button
              className="btn btn-primary"
              id="logout-btn"
              onClick={handleClick}
            >
              Logout
            </button>
          </div>
        </div>
      </nav>
    </div>
  )
}

export default NavBar
