import { Link } from "react-router-dom"

function BnbListing({ bnb }) {
  const { name, location, num_of_rooms, cost_per_night, description } = bnb
  return (
    <div>
      <h2>{name}</h2>
      <span>
        Number of Rooms {num_of_rooms} - Cost /Night ${cost_per_night}
      </span>
      <p>{description}</p>
      <p>Located in {location}</p>
      <button>
        <Link to="/guest_log">View Guest Log</Link>
      </button>
    </div>
  )
}

export default BnbListing
