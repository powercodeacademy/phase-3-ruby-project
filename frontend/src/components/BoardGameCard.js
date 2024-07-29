
function BoardGameCard({ boardGame }) {
  return (
    <div className="col-lg-4 mb-4">
      <div className="card mx-auto" style={{ width: "25rem" }}>
        <div className="card-body">
          <h5 className="card-title">{boardGame.name}</h5>
          <p>
            {/* <Link to={`/spells/${boardGame.id}`}>View Board Game</Link> */}
          </p>
        </div>
      </div>
    </div>
  )
}

export default BoardGameCard
