import { useState, useEffect } from "react"
import BoardGameCard from "../components/BoardGameCard"
import { getAllBoardGames } from "../services/fetchers"
import { useUser } from "../context/UserContext"

function BoardGamePage() {
  const [boardGames, setBoardGames] = useState(null)
  const { user } = useUser()

  console.log(user)

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
    <div className="container">
      <header className="my-4">
        <h1 className="text-center">Board Games</h1>
      </header>
      <div className="row row-cols-1 row-cols-md-2 g-4">
      { boardGameCards }
      </div>
    </div>
  )
}

export default BoardGamePage
