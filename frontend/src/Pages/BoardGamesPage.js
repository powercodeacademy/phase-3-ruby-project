import { useState, useEffect } from "react"
import BoardGameCard from "../components/BoardGameCard"
import { getAllBoardGames } from "../services/fetchers"

function BoardGamePage() {
  const [boardGames, setBoardGames] = useState(null)

  useEffect(() => {
    getAllBoardGames().then(boardGamesList => setBoardGames(boardGamesList))
  },[])

  if(!boardGames){
    return (
      <div>
        <h1 className="board-games-header">Board Games</h1>
        <h2>Loading....</h2>
      </div>
    )
  }

  const boardGameCards = boardGames.map(boardGame => {
    return <BoardGameCard key={boardGame.id} boardGame={boardGame}/>
  })

  return(
    <div>
      {boardGameCards}
    </div>
  )
}

export default BoardGamePage
