import { useEffect, useState } from "react"
import { useParams } from "react-router-dom"
import { getBoardGameData } from "../services/fetchers"
import ReviewBlock from "../components/ReviewBlock"
import ReviewForm from "../components/ReviewForm"

function BoardGameDetailsPage() {
  const params = useParams()
  const [boardGameData, setBoardGameData] = useState(null)
  const [reviews, setReviews] = useState(null)
  const [showForm, setShowForm] = useState(false)

  const fetchBoardGameData = () => {
    getBoardGameData(params.index).then((boardGameData) => {
      setBoardGameData(boardGameData)
      setReviews(boardGameData.reviews)
    })
  }

  useEffect(fetchBoardGameData, [params.index])

  if (!boardGameData || !reviews) {
    return <h1>Loading...</h1>
  }

  const reviewBlocks = reviews.map((review) => {
    return <ReviewBlock key={review.id} review={review} />
  })

  console.log(reviews)

  return (
    <div className="container mt-4">
      <div className="row">
        <div className="col-md-4">
          <img
            src={boardGameData.image}
            alt={boardGameData.name}
            className="img-fluid"
          />
        </div>
        <div className="col-md-8">
          <h1>{boardGameData.name}</h1>
          <p className="lead">{boardGameData.description}</p>
          <div className="rating">
            <strong>Rating: </strong>
            {boardGameData.rating} / 5
          </div>
          <hr />
          <div className="reviews">
            <h3>Reviews</h3>
            <button
              className="btn btn-primary"
              id="review_button"
              onClick={() => setShowForm(!showForm)}
            >
              Add Review
            </button>
            {showForm ? (
              <ReviewForm
                closeForm={setShowForm}
                boardGameId={boardGameData.id}
                reviews={reviews}
                setReviews={setReviews}
              />
            ) : null}
            {boardGameData.reviews.length > 0 ? (
              reviewBlocks
            ) : (
              <p>No Reviews</p>
            )}
          </div>
        </div>
      </div>
    </div>
  )
}

export default BoardGameDetailsPage
