import { useState } from "react"
import { useUser } from "../context/UserContext"
import ReviewForm from "./ReviewForm"

function ReviewBlock({ review }) {
  const [showForm, setShowForm] = useState(false)
  const { user } = useUser()

  const checkUser = () => {
    return review.user.id == user
  }

  return (
    <div key={review.id} className="review">
      {checkUser() ? (
        <button
          className="btn btn-primary"
          id="edit-button"
          onClick={() => setShowForm(!showForm)}
        >
          Edit
        </button>
      ) : null}
      {showForm ? <ReviewForm /> : (
        <>
          <h4>{review.title}</h4>
          <h5>
            <em>by {review.user.username}</em>
          </h5>
          <p>{review.body}</p>
          <p>
            <strong>Rating:</strong> {review.rating} / 5
          </p>
          <hr />
        </>
      )}
    </div>
  )
}

export default ReviewBlock
