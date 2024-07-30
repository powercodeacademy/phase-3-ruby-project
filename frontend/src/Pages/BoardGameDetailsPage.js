import { useEffect, useState } from "react"
import { useParams } from "react-router-dom"
import { getBoardGameData } from "../services/fetchers"

function BoardGameDetailsPage() {
  const params = useParams()
  const [boardGameData, setBoardGameData] = useState(null)

  const fetchBoardGameData = () => {
    getBoardGameData(params.index).then((boardGameData) =>
      setBoardGameData(boardGameData)
    )
  }

  useEffect(fetchBoardGameData, [params.index])

  if(!boardGameData){
    return <h1>Loading...</h1>
  }

  return <div>Board Game Details</div>
}

export default BoardGameDetailsPage
