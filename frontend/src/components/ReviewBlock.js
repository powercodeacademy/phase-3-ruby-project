import { useState } from "react"
import { useUser } from "../context/UserContext"
import ReviewForm from "./ReviewForm"
import { updateReview } from "../services/fetchers"

function ReviewBlock({ review, boardGameId, reviews, setReviews }) {
  const [showForm, setShowForm] = useState(false)
  const { user } = useUser()

  const checkUser = () => {
    return review.user.id == user
  }

  const editReview = (editedReview) => {
    updateReview(editedReview).then(reviewResp => {
      setReviews(reviews.map(review => review.id === editedReview.id ? reviewResp : review))
    })
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
      {showForm ? (
        <ReviewForm
          review={review}
          closeForm={setShowForm}
          boardGameId={boardGameId}
          handleReview={editReview}
        />
      ) : (
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
