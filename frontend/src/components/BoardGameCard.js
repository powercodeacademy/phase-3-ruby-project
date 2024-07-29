
function BoardGameCard({ boardGame }) {
  return (
    // <div className="col-lg-4 mb-4">
    //   <div className="card mx-auto" style={{ width: "25rem" }}>
    //     <div className="card-body">
    //       <h5 className="card-title">{boardGame.name}</h5>
    //       <p>
    //         {/* <Link to={`/spells/${boardGame.id}`}>View Board Game</Link> */}
    //       </p>
    //     </div>
    //   </div>
    // </div>
    <div className="card">
      <img src={boardGame.image} className="card-img-top" alt={boardGame.name}/>
      <div className="card-body">
        <h5 className="card-title">{boardGame.name}</h5>
        <p className="card-text">{boardGame.description}</p>
        <a href="#" className="btn btn-primary">Go somewhere</a>
      </div>
    </div>
  )
}

export default BoardGameCard
