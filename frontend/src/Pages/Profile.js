import { useEffect, useState } from "react"
import NavBar from "../components/NavBar"
import { useUser } from "../context/UserContext"
import { getUser } from "../services/fetchers"

function Profile(){
  const { user, setUser } = useUser()
  const [ userData, setUserData] = useState(null)

  useEffect(() => {
    const fetchUser = async () => {
      const savedUser = localStorage.getItem("userId");
      const user = savedUser ? JSON.parse(savedUser) : null;
      if (user) {
        setUser(user);
        const userResp = await getUser(user);
        setUserData(userResp);
      }
    };

    fetchUser();
  }, [setUser]);

  if(!userData){
    return <h1>Loading...</h1>
  }

  return(
    <div>
      <NavBar />
      <div className="profile">
        <h2 className="text-center">Profile</h2>
        <div className="card">
          <div className="card-body">
            <h5 className="card-title">Username: {userData.username}</h5>
          </div>
        </div>
      </div>
    </div>
  )
}

export default Profile
