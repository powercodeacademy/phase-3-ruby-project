
function BoardGameCard({ boardGame }) {
  return (
    <div className="col">
      <div className="card" style={{width:'20rem'}}>
        <img src={boardGame.image} className="card-img-top" alt={boardGame.name}/>
        <div className="card-body">
          <h5 className="card-title">{boardGame.name}</h5>
          <p className="card-text">{boardGame.description}</p>
          <a href="#" className="btn btn-primary">Go somewhere</a>
        </div>
      </div>
    </div>
  )
}

export default BoardGameCard
