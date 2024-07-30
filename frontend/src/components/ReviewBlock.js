

function ReviewBlock({ review }) {

  return (
    <div key={review.id} className="review">
      <h4>{review.title}</h4>
      <h5>
        <em>by {review.user.username}</em>
      </h5>
      <p>{review.body}</p>
      <p>
        <strong>Rating:</strong> {review.rating} / 5
      </p>
      <hr />
    </div>
  )
}

export default ReviewBlock
