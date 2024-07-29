const url = "http://localhost:9292/board_games"

const getAllBoardGames = () => {
  return fetch(url).then(resp => resp.json())
}

export { getAllBoardGames }
