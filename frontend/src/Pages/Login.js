import React, { useState } from 'react'
import { useUser } from '../context/UserContext'
import { loginUser } from '../services/fetchers'

function Login(){
  const { setUser } = useUser()
  const [username, setUsername] = useState('')
  const [password, setPassword] = useState('')

  const handleSubmit = (event) => {
    event.preventDefault()
    loginUser().then(data => {
      if(data.success){
        setUser(data.user)
      } else {
        console.error(data.message)
      }
    })
  }

  return(
    <div className="container-fluid">
      <div className="row justify-content-center align-items-center min-vh-100">
        <div className="col-md-4 col-lg-3">
          <div className="login-form bg-light p-4 rounded">
            <h2 className="text-center mb-4">Login</h2>
            <form>
              <div className="form-group mb-3">
                <label htmlFor="username">Username</label>
                <input type="text" className="form-control" id="username" placeholder="Enter your username" />
              </div>
              <div className="form-group mb-4">
                <label htmlFor="password">Password</label>
                <input type="password" className="form-control" id="password" placeholder="Enter your password" />
              </div>
              <button type="submit" className="btn btn-primary w-100">Login</button>
            </form>
          </div>
        </div>
      </div>
    </div>
  )
}

export default Login
